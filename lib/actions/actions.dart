import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future auth(BuildContext context) async {
  // Wait for user to be loaded (important for page reloads)
  // Check if currentUser is available and has a valid UID
  if (currentUser == null || currentUserUid.isEmpty) {
    // User not loaded yet, wait a bit and retry
    await Future.delayed(const Duration(milliseconds: 500));
    if (currentUser == null || currentUserUid.isEmpty) {
      // Still not loaded, return without doing anything
      // The auth check will be retried when user is available
      return;
    }
  }

  List<UsersRow>? retornUserLogin;
  Function() navigate = () {};
  retornUserLogin = await UsersTable().queryRows(
    queryFn: (q) => q.eqOrNull(
      'id',
      currentUserUid,
    ),
  );

  // If query returned empty or user not found, don't logout - might be a timing issue
  if (retornUserLogin.isEmpty) {
    // Query failed or user not found, but don't logout immediately
    // This could be a timing issue on page reload
    return;
  }

  if (retornUserLogin.firstOrNull?.verificado != true) {
    GoRouter.of(context).prepareAuthEvent();
    await authManager.signOut();
    GoRouter.of(context).clearRedirectLocation();

    navigate =
        () => context.goNamedAuth(LoginWidget.routeName, context.mounted);
    return;
  }
  FFAppState().user = UserStruct(
    nome: retornUserLogin.firstOrNull?.nome,
    email: retornUserLogin.firstOrNull?.email,
    tipoUser: retornUserLogin.firstOrNull?.tipoUser,
  );
  FFAppState().update(() {});
  if (retornUserLogin.firstOrNull?.tipoUser != 'Admin') {
    if (retornUserLogin.firstOrNull?.tipoUser != 'Moderador') {
      GoRouter.of(context).prepareAuthEvent();
      await authManager.signOut();
      GoRouter.of(context).clearRedirectLocation();

      navigate =
          () => context.goNamedAuth(LoginWidget.routeName, context.mounted);
      return;
    }
  }
  FFAppState().nada = 'nada';
  FFAppState().update(() {});

  navigate();
}
