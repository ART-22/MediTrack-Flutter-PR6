
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 96,
          height: 96,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.medication_rounded,
              size: 96,
              color: Colors.teal,
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          'MediTrack',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade800,
          ),
        ),
      ],
    );
  }
}
