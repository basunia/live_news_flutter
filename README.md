# Live News App Flutter

A flutter app the fetches live news from server, store and shows. 
It has authentication feature with dynamic domain generation.

<p align="center">
<img src="ss/ss_1.jpg" width="200" style="margin: 0px 0px 20px 0px;">  <img src="ss/ss_2.jpg" width="200">  <img src="ss/ss_3.jpg" width="200">  <img src="ss/ss_4.jpg" width="200">
</p>

### Topics covered
* Modularizing architechure layer with flutter [package](https://docs.flutter.dev/development/packages-and-plugins/using-packages)
* [Bloc](https://bloclibrary.dev/#/) library for state management that also enforces to follow [clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [Hydrated bloc/cubit](https://github.com/felangel/bloc/tree/master/packages/hydrated_bloc) for state management with persisted state/data
* [Google map](https://pub.dev/packages/google_maps_flutter)
* [Multi language/locale support](https://docs.flutter.dev/development/accessibility-and-localization/internationalization)
* [Material theme](https://docs.flutter.dev/cookbook/design/themes) with dark and light mode
* Popular [dio](https://github.com/flutterchina/dio) package for http service

### Installation

If you're new to Flutter the first thing you'll need is to follow the [setup instructions](https://flutter.dev/docs/get-started/install). 

Once Flutter is setup, you can use the latest `stable` channel:
 * Run `flutter channel stable`
 * Run `flutter upgrade`

Once you're on `dev` and desktop is enabled, you're ready to run the app:
* `flutter run -d windows`
* `flutter run -d macos`
* `flutter run -d linux`
* `flutter run -d android`
* `flutter run -d ios`
* `flutter run -d web`

If you re-start your IDE, you should also see a new launch option for your current desktop platform.

### Client Keys
This repo includes a free api for fetching live news. In order to run the app generate an api on your own and replace `baseUrlNews` and in the `base_client.dart` file.

### License

This application is released under the [MIT license](LICENSE.md). You can use the code for any purpose, including commercial projects.

[![license](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

