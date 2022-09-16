import 'package:flutter/material.dart';
import 'package:mail_automation/auth/view/auth_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
    required this.onPageChange,
    required this.onSignUp,
  }) : super(key: key);

  final AuthCallBack onSignUp;
  final VoidCallback onPageChange;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          const Text('SignUp with username and passeword'),
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
              labelText: 'Enter your password',
            ),
          ),
          const Text('Sign Up to proceed'),
          ElevatedButton(
              onPressed: () {
                widget.onSignUp(
                    _userNameController.text, _passwordController.text);
              },
              child: const Text('Sign Up')),
          OutlinedButton(
              onPressed: widget.onPageChange,
              child: const Text('Go to Log In page')),
        ],
      ),
    );
  }
}
