import 'dart:async';

import 'package:flutter/material.dart';
import '/auth/auth_manager.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/core/utils/logger.dart';
import '/core/errors/error_handler.dart';
import 'email_auth.dart';

import 'supabase_user_provider.dart';

export '/auth/base_auth_user_provider.dart';

class SupabaseAuthManager extends AuthManager with EmailSignInManager {
  @override
  Future signOut() {
    return SupaFlow.client.auth.signOut();
  }

  @override
  Future deleteUser(BuildContext context) async {
    try {
      if (!loggedIn) {
        AppLogger.w('Error: delete user attempted with no logged in user!');
        return;
      }
      await currentUser?.delete();
    } catch (e, stackTrace) {
      ErrorHandler.showErrorFromException(context, e, stackTrace);
    }
  }

  @override
  Future updateEmail({
    required String email,
    required BuildContext context,
  }) async {
    try {
      if (!loggedIn) {
        AppLogger.w('Error: update email attempted with no logged in user!');
        return;
      }
      await currentUser?.updateEmail(email);
    } catch (e, stackTrace) {
      ErrorHandler.showErrorFromException(context, e, stackTrace);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content:
              Text('E-mail de confirmação de alteração de e-mail enviado!')),
    );
  }

  @override
  Future updatePassword({
    required String newPassword,
    required BuildContext context,
  }) async {
    try {
      if (!loggedIn) {
        AppLogger.w('Error: update password attempted with no logged in user!');
        return;
      }
      await currentUser?.updatePassword(newPassword);
    } catch (e, stackTrace) {
      ErrorHandler.showErrorFromException(context, e, stackTrace);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content:
              Text('E-mail de confirmação de alteração de e-mail enviado!')),
    );
  }

  @override
  Future resetPassword({
    required String email,
    required BuildContext context,
    String? redirectTo,
  }) async {
    try {
      await SupaFlow.client.auth
          .resetPasswordForEmail(email, redirectTo: redirectTo);
    } catch (e, stackTrace) {
      ErrorHandler.showErrorFromException(context, e, stackTrace);
      return null;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('E-mail de redefinição de senha enviado!')),
    );
  }

  @override
  Future<BaseAuthUser?> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailSignInFunc(email, password),
      );

  @override
  Future<BaseAuthUser?> createAccountWithEmail(
    BuildContext context,
    String email,
    String password,
  ) =>
      _signInOrCreateAccount(
        context,
        () => emailCreateAccountFunc(email, password),
      );

  /// Tries to sign in or create an account using Supabase Auth.
  /// Returns the User object if sign in was successful.
  Future<BaseAuthUser?> _signInOrCreateAccount(
    BuildContext context,
    Future<User?> Function() signInFunc,
  ) async {
    try {
      final user = await signInFunc();
      final authUser = user == null ? null : AcquaWayWebSupabaseUser(user);

      // Update currentUser here in case user info needs to be used immediately
      // after a user is signed in. This should be handled by the user stream,
      // but adding here too in case of a race condition where the user stream
      // doesn't assign the currentUser in time.
      if (authUser != null) {
        currentUser = authUser;
        AppStateNotifier.instance.update(authUser);
      }
      return authUser;
    } catch (e, stackTrace) {
      ErrorHandler.showErrorFromException(context, e, stackTrace);
      return null;
    }
  }
}
