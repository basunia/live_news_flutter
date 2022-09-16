import 'package:flutter/material.dart';
import 'package:mail_tm_api/mail_tm_api.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.profile}) : super(key: key);

  static Route<void> route({required Account profile}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (context) => ProfilePage(profile: profile),
    );
  }

  final Account profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(profile.userId), Text(profile.emailId)],
    );
  }
}
