import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      final isLoggedIn = authState.maybeWhen(
        data: (user) => user != null,
        orElse: () => false,
      );

      final isGoingToSplash = state.matchedLocation == '/splash';
      final isGoingToAuth = state.matchedLocation.startsWith('/auth');

      if (!isLoggedIn) {
        return isGoingToAuth ? null : '/auth/login';
      }

      if (isGoingToAuth || isGoingToSplash) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/auth/signup',
        name: 'signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/recipes',
        name: 'recipes',
        builder: (context, state) => const RecipesScreen(),
      ),
      GoRoute(
        path: '/planner',
        name: 'planner',
        builder: (context, state) => const PlannerScreen(),
      ),
      GoRoute(
        path: '/shopping',
        name: 'shopping',
        builder: (context, state) => const ShoppingScreen(),
      ),
      GoRoute(
        path: '/progress',
        name: 'progress',
        builder: (context, state) => const ProgressScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});

// Placeholder screens - будут заменены на реальные
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Login')));
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Sign Up')));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Home')));
  }
}

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Recipes')));
  }
}

class PlannerScreen extends StatelessWidget {
  const PlannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Planner')));
  }
}

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Shopping')));
  }
}

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Progress')));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile')));
  }
}

import 'package:flutter/material.dart';
