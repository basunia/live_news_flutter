import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings/cubit/settings_cubit.dart';
import '../utils/localization.dart';

class LocalizationSettingsPage extends StatefulWidget {
  const LocalizationSettingsPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider.value(
        value: context.read<SettingsCubit>(),
        child: const LocalizationSettingsPage(),
      );
    });
  }

  @override
  State<LocalizationSettingsPage> createState() =>
      _LocalizationSettingsPageState();
}

class _LocalizationSettingsPageState extends State<LocalizationSettingsPage> {
  String dropdownValue = Localization.menuItems.localeUK;
  String icon = Localization.localeIcons.localeUK;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dropdownValue = (context.locale.toStringWithSeparator() ==
            Localization.localeCodes.localeUK)
        ? Localization.menuItems.localeUK
        : Localization.menuItems.localeRomania;

    icon = (context.locale.toStringWithSeparator() ==
            Localization.localeCodes.localeUK)
        ? Localization.localeIcons.localeUK
        : Localization.localeIcons.localeRomania;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('title').tr()),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'change_language',
              style: textTheme.labelLarge,
            ).tr(),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.only(left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(color: Colors.black, width: .9),
              ),
              child: Container(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      DropdownButton<String>(
                        icon: Container(
                          padding: const EdgeInsets.only(
                            left: 15,
                          ),
                          height: 40,
                          width: 40,
                          child: Image(
                            image: AssetImage("assets/images/$icon"),
                          ),
                        ),
                        iconSize: 18,
                        elevation: 16,
                        value: dropdownValue,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          color: Colors.transparent,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue == Localization.menuItems.localeUK) {
                            dropdownValue = Localization.menuItems.localeUK;
                            icon = Localization.localeIcons.localeUK;
                            context
                                .setLocale(Localization.locales.localeUK)
                                .then((value) {
                              context.read<SettingsCubit>().setLocale(
                                  Localization.localeSequence.localeUK);
                            });
                          } else if (newValue ==
                              Localization.menuItems.localeRomania) {
                            dropdownValue =
                                Localization.menuItems.localeRomania;
                            icon = Localization.localeIcons.localeRomania;
                            context
                                .setLocale(Localization.locales.localeRomania)
                                .then((value) {
                              context.read<SettingsCubit>().setLocale(
                                  Localization.localeSequence.localeRomania);
                            });
                          }
                        },
                        items: Localization.menuItems
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ).tr(),
                          );
                        }).toList(),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 18,
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
