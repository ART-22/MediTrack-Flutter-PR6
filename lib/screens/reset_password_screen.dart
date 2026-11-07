
import 'package:flutter/material.dart';
import '../widgets/auth_logo.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends State<ResetPasswordScreen> {
  final _loginController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  void _resetPassword() {
    final login = _loginController.text.trim();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Відновлення пароля'),
        content: Text(
          login.isEmpty
              ? 'Введіть логін або електронну пошту.'
              : 'Запит для "$login" прийнято в демонстраційному режимі. Справжній лист не надсилається.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Відновлення пароля'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.stretch,
                children: [
                  const AuthLogo(),
                  const SizedBox(height: 24),

                  const Text(
                    'Введіть логін або електронну пошту для відновлення доступу.',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: _loginController,
                    decoration: const InputDecoration(
                      labelText: 'Логін або електронна пошта',
                      prefixIcon: Icon(Icons.mail_outline),
                    ),
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _resetPassword,
                    child: const Text('Відновити пароль'),
                  ),

                  const SizedBox(height: 12),

                  OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Повернутися до входу',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
