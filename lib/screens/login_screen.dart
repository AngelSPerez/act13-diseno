import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.go('/'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Log In',
                  style: textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme.primaryContainer,
                    border: Border.all(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'E-mail:',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(hint: 'angel@gmail.com', context: context),
              const SizedBox(height: 20),
              Text(
                'Password:',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(hint: '••••••', obscure: true, context: context),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/recipes'),
                  child: const Text('Log In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    bool obscure = false,
    required BuildContext context,
  }) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
