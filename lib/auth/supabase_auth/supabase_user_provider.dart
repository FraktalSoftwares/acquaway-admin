import 'package:rxdart/rxdart.dart';

import '/backend/supabase/supabase.dart';
import '../base_auth_user_provider.dart';

export '../base_auth_user_provider.dart';

class AcquaWayWebSupabaseUser extends BaseAuthUser {
  AcquaWayWebSupabaseUser(this.user);
  User? user;
  @override
  bool get loggedIn => user != null;

  @override
  AuthUserInfo get authUserInfo => AuthUserInfo(
        uid: user?.id,
        email: user?.email,
        phoneNumber: user?.phone,
      );

  @override
  Future? delete() =>
      throw UnsupportedError('The delete user operation is not yet supported.');

  @override
  Future? updateEmail(String email) async {
    final response =
        await SupaFlow.client.auth.updateUser(UserAttributes(email: email));
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? updatePassword(String newPassword) async {
    final response = await SupaFlow.client.auth.updateUser(
      UserAttributes(password: newPassword),
    );
    if (response.user != null) {
      user = response.user;
    }
  }

  @override
  Future? sendEmailVerification() => throw UnsupportedError(
      'The send email verification operation is not yet supported.');

  @override
  bool get emailVerified {
    // Reloads the user when checking in order to get the most up to date
    // email verified status.
    if (loggedIn && user!.emailConfirmedAt == null) {
      refreshUser();
    }
    return user?.emailConfirmedAt != null;
  }

  @override
  Future refreshUser() async {
    await SupaFlow.client.auth
        .refreshSession()
        .then((_) => user = SupaFlow.client.auth.currentUser);
  }
}

/// Generates a stream of the authenticated user.
/// [SupaFlow.client.auth.onAuthStateChange] does not yield any values until the
/// user is already authenticated. So we add a default null user to the stream,
/// if we need to interact with the [currentUser] before logging in.
Stream<BaseAuthUser> acquaWayWebSupabaseUserStream() {
  // Check if there's an existing session (important for page reloads)
  // This ensures the user stays logged in after page refresh
  final currentUserFromSession = SupaFlow.client.auth.currentUser;
  final hasExistingSession = currentUserFromSession != null;

  final supabaseAuthStream = SupaFlow.client.auth.onAuthStateChange.debounce(
      (authState) => authState.event == AuthChangeEvent.tokenRefreshed
          ? TimerStream(authState, const Duration(seconds: 1))
          : Stream.value(authState));

  // If there's an existing session, start with the current user
  // Otherwise, start with null and wait for auth state changes
  final initialUser = hasExistingSession
      ? AcquaWayWebSupabaseUser(currentUserFromSession)
      : null;

  final initialStream = initialUser != null
      ? Stream<BaseAuthUser>.value(initialUser)
      : Stream<BaseAuthUser>.value(
          AcquaWayWebSupabaseUser(null),
        );

  return initialStream.concatWith([
    supabaseAuthStream.map<BaseAuthUser>(
      (authState) {
        currentUser = AcquaWayWebSupabaseUser(authState.session?.user);
        return currentUser!;
      },
    )
  ]);
}
