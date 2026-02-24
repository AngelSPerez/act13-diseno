import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.primary, width: 2),
                    color: colorScheme.primaryContainer,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 54,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Name:',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              _buildTextField(hint: 'Angel Salinas', context: context),
              const SizedBox(height: 20),
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
                  child: const Text('Register'),
                ),
              ),
              const SizedBox(height: 32),
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
