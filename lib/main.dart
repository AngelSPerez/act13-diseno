import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//RUTAS NOMBRADAS
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/recipes_screen.dart';

void main() {
  runApp(const RecipeReviveApp());
}

//RUTAS NOMBRADAS
class RecipeReviveApp extends StatelessWidget {
  const RecipeReviveApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const WelcomeScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (BuildContext acontext, GoRouterState state) =>
              const RegisterScreen(),
        ),
        GoRoute(
          path: '/recipes',
          builder: (BuildContext context, GoRouterState state) =>
              const RecipesScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Recipe Revive',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
