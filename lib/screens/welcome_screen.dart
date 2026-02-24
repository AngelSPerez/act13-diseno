import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/theme_toggle.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topRight,
                child: ThemeToggle(),
              ),
              const Spacer(flex: 2),
              Text(
                'Welcome to',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Recipe Revive',
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.primary,
                    width: 2.5,
                  ),
                ),
                child: const Center(
                  child: Text('🍴', style: TextStyle(fontSize: 56)),
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/register'),
                  child: const Text('Register Now!'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null, // Disabled
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        colorScheme.onSurface.withOpacity(0.1),
                  ),
                  child: const Text('Log In'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
