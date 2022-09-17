import 'package:easy_localization/easy_localization.dart';
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'enter_your_username'.tr(),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'enter_your_password'.tr(),
                ),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                widget.onLogIn(
                    _userNameController.text, _passwordController.text);
              },
              child: const Text('login').tr()),
          OutlinedButton(
            onPressed: widget.onPageChange,
            child: const Text(
              'go_to_signup_page',
              style: TextStyle(fontWeight: FontWeight.w400),
            ).tr(),
          ),
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
