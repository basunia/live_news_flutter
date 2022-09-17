import 'dart:ui';

extension MenuItemsFilter<E> on Iterable<E> {
  E get localeUK => first;
  E get localeRomania => last;
}

class Localization {
  static final locales = [const Locale('en', 'UK'), const Locale('ro', 'RO')];
  static final menuItems = ['English', 'Romania'];
  static final localeIcons = ['uk.png', 'romania.png'];
  static final localeCodes = ['en_UK', 'ro_RO'];

  // TODO: needs to use indexes instead of this
  static final localeSequence = [0, 1];
}
