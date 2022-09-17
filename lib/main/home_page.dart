import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mail_automation/main/home_nav_drawer.dart';
import 'package:mail_automation/news/view/news_page.dart';
import 'package:mail_repository/mail_repository.dart';

import '../auth/bloc/auth_bloc.dart';
import '../auth/view/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route({required BuildContext context}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
      builder: (_) => RepositoryProvider(
        create: (context) => context.read<MailRepository>(),
        child: BlocProvider.value(
          value: context.read<AuthBloc>(),
          child: const HomePage(),
        ),
      ),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // static TextStyle optionStyle =
  //     const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    NewsPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).backgroundColor,
        backgroundColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: brandColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
