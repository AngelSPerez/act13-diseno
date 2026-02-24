import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/theme_provider.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const RecipeReviveApp(),
    ),
  );
}

class RecipeReviveApp extends StatelessWidget {
  const RecipeReviveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp.router(
          title: 'Recipe Revive',
          debugShowCheckedModeBanner: false,
          theme: _buildTheme(Brightness.light),
          darkTheme: _buildTheme(Brightness.dark),
          themeMode: themeProvider.themeMode,
          routerConfig: AppRouter.router,
        );
      },
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    const Color primarySeedColor = Color(0xFF7C6FCD);
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: primarySeedColor,
      brightness: brightness,
    );
    final TextTheme appTextTheme = GoogleFonts.poppinsTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: appTextTheme.copyWith(
        displayLarge: appTextTheme.displayLarge?.copyWith(
          fontSize: 57,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: appTextTheme.titleLarge?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: appTextTheme.bodyMedium?.copyWith(
          fontSize: 14,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        titleTextStyle: appTextTheme.titleLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorScheme.onPrimary,
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: appTextTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.onSurface.withAlpha(77)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.onSurface.withAlpha(77)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
    );
  }
}
