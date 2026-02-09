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

  final userRow = retornUserLogin.firstOrNull;
  final tipoUser = userRow?.tipoUser?.trim();

  // Apenas Admin e Moderador podem acessar o sistema
  const allowedRoles = ['Admin', 'Moderador'];
  final isAllowedRole = tipoUser != null && allowedRoles.contains(tipoUser);

  if (!isAllowedRole) {
    GoRouter.of(context).prepareAuthEvent();
    await authManager.signOut();
    GoRouter.of(context).clearRedirectLocation();
    navigate =
        () => context.goNamedAuth(LoginWidget.routeName, context.mounted);
    navigate();
    return;
  }

  // Admin/Moderador não precisam de verificado (evita deslogar ao atualizar a página)

  FFAppState().user = UserStruct(
    nome: userRow?.nome,
    email: userRow?.email,
    tipoUser: userRow?.tipoUser,
  );
  FFAppState().update(() {});
  FFAppState().nada = 'nada';
  FFAppState().update(() {});

  navigate();
}
