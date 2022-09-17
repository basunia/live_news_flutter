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
  String icon = Localization.localeIcons.localeUS;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    icon = (context.locale.toStringWithSeparator() ==
            Localization.localeCodes.localeUS)
        ? Localization.localeIcons.localeUS
        : Localization.localeIcons.localeBengali;
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
                  style: textTheme.titleMedium?.copyWith(color: Colors.white),
                ).tr(),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  'riseup_lab',
                  style: textTheme.headline6?.copyWith(color: Colors.white),
                ).tr(),
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
                title: const Text('dark_mode').tr(),
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
          ListTile(
            title: const Text('lanuguage').tr(),
            onTap: () {
              Navigator.push(context, LocalizationSettingsPage.route());
            },
          ),
        ],
      ),
    );
  }
}
