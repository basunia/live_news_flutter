import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/localization.dart';
import '../localization/localization_settings.dart';
import '../settings/cubit/settings_cubit.dart';
import '../settings/cubit/settings_state.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String icon = Localization.localeIcons.localeUK;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    icon = (context.locale.toStringWithSeparator() ==
            Localization.localeCodes.localeUK)
        ? Localization.localeIcons.localeUK
        : Localization.localeIcons.localeRomania;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'title',
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ).tr(),
                const SizedBox(
                  height: 12.0,
                ),
                Image(
                  image: AssetImage("assets/images/$icon"),
                ),
              ],
            ),
          ),
          BlocSelector<SettingsCubit, SettingsState, int>(
            selector: (state) {
              return state.themeId;
            },
            builder: (context, state) {
              return SwitchListTile(
                activeColor: Theme.of(context).colorScheme.secondary,
                title: const Text('Dark Mode'),
                value: state == 0 ? false : true,
                onChanged: (bool value) {
                  setState(() {
                    context
                        .read<SettingsCubit>()
                        .setTheme(value == false ? 0 : 1);
                  });
                },
                secondary: Icon(
                  Icons.lightbulb,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              );
            },
          ),
          // ListTile(
          //   title: const Text('my_location').tr(),
          //   onTap: () {
          //     Navigator.push(context, LocationPage.route());
          //   },
          // ),
          ListTile(
            title: const Text('lanuguage').tr(),
            onTap: () {
              Navigator.push(context, LocalizationSettingsPage.route());
            },
          ),
        ],
      ),
    );
    // return Builder(builder: (context) {
    //   final width = MediaQuery.of(context).size.width;
    //   final height = MediaQuery.of(context).size.height;

    //   return Container(
    //       height: height,
    //       width: width * 0.8,
    //       decoration: const BoxDecoration(color: Colors.white),
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ListView(
    //           children: [],
    //         ),
    //         // child: Column(
    //         //   mainAxisAlignment: MainAxisAlignment.center,
    //         //   crossAxisAlignment: CrossAxisAlignment.start,
    //         //   children: [
    //         //     InkWell(
    //         //         onTap: () {
    //         //           Navigator.push(context, LocationPage.route());
    //         //         },
    //         //         child: const Text('My location')),
    //         //     const SizedBox(
    //         //       height: 8.0,
    //         //     ),
    //         //     const Text('Change language'),
    //         //   ],
    //         // ),
    //       ));
    // });
  }
}
