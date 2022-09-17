import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('empty_data').tr());
  }
}
