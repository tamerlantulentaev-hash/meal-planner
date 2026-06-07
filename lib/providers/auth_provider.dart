import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import '../models/user.dart' as app_user;

final authServiceProvider = Provider((ref) => AuthService());

final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.authStateChanges;
});

final currentUserProvider = Provider<User?>((ref) {
  final authService = ref.watch(authServiceProvider);
  return authService.currentUser;
});

final signUpProvider = FutureProvider.family<void, SignUpParams>((ref, params) async {
  final authService = ref.watch(authServiceProvider);
  await authService.signUpWithEmail(
    email: params.email,
    password: params.password,
  );
});

final signInProvider = FutureProvider.family<void, SignInParams>((ref, params) async {
  final authService = ref.watch(authServiceProvider);
  await authService.signInWithEmail(
    email: params.email,
    password: params.password,
  );
});

final signOutProvider = FutureProvider<void>((ref) async {
  final authService = ref.watch(authServiceProvider);
  await authService.signOut();
});

final resetPasswordProvider = FutureProvider.family<void, String>((ref, email) async {
  final authService = ref.watch(authServiceProvider);
  await authService.resetPassword(email: email);
});

final updateProfileProvider = FutureProvider.family<void, UpdateProfileParams>(
  (ref, params) async {
    final authService = ref.watch(authServiceProvider);
    await authService.updateProfile(
      displayName: params.displayName,
      photoUrl: params.photoUrl,
    );
  },
);

// Parameter classes
class SignUpParams {
  final String email;
  final String password;

  SignUpParams({
    required this.email,
    required this.password,
  });
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({
    required this.email,
    required this.password,
  });
}

class UpdateProfileParams {
  final String? displayName;
  final String? photoUrl;

  UpdateProfileParams({
    this.displayName,
    this.photoUrl,
  });
}
