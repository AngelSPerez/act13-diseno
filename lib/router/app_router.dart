import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/welcome_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/recipes_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // Explicitly set initial route
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const WelcomeScreen();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/recipes',
        builder: (BuildContext context, GoRouterState state) {
          return const RecipesScreen();
        },
      ),
    ],
  );
}
