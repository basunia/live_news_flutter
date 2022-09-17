import 'package:flutter/material.dart';
import 'package:mail_automation/auth/view/auth_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.onPageChange, required this.onLogIn})
      : super(key: key);

  final AuthCallBack onLogIn;
  final VoidCallback onPageChange;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login with username and passeword'),
          TextFormField(
            controller: _userNameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your username',
            ),
          ),
          const Text('Login to proceed'),
          ElevatedButton(
              onPressed: () {
                widget.onLogIn(
                    _userNameController.text, _passwordController.text);
              },
              child: const Text('Log In')),
          OutlinedButton(
              onPressed: widget.onPageChange,
              child: const Text('Go to Sign Up page')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }
}
