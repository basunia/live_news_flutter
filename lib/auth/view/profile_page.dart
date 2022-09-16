import 'package:flutter/material.dart';
import 'package:mail_automation/auth/view/auth_page.dart';
// import 'package:mail_tm_api/mail_tm_api.dart';
import 'package:mail_repository/src/model/account.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  static Route<void> route({Account? profile}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) => ProfilePage(profile: profile),
    );
  }

  final Account? profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 32.0,
          ),
          Center(child: Text(profile?.userId ?? '')),
          Center(child: Text(profile?.emailId ?? '')),
          OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              },
              child: const Text('Log out'))
        ],
      ),
    );
  }
}
