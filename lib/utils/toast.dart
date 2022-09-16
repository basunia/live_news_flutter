import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showMessage(BuildContext context, String message) {
  showTopSnackBar(
    context,
    CustomSnackBar.error(
      textStyle: const TextStyle(fontSize: 20.0),
      message: message.tr(),
    ),
  );
}
