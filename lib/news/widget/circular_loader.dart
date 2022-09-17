import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          height: 8,
          width: 8,
          child: CircularProgressIndicator(
              color: themeData.primaryColor, strokeWidth: 0.3),
        ),
      ),
    );
  }
}
