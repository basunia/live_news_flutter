import 'dart:ui';

extension MenuItemsFilter<E> on Iterable<E> {
  E get localeUS => first;
  E get localeBengali => last;
}

class Localization {
  static final locales = [const Locale('en', 'US'), const Locale('bn', 'BD')];
  static final menuItems = ['english', 'bengali'];
  static final localeIcons = ['uk.png', 'bd.png'];
  static final localeCodes = ['en_US', 'bn_BD'];

  // TODO: needs to use indexes instead of this
  static final localeSequence = [0, 1];
}
