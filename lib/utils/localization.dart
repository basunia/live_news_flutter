import 'dart:ui';

extension MenuItemsFilter<E> on Iterable<E> {
  E get localeUK => first;
  E get localeRomania => last;
}

class Localization {
  static final locales = [const Locale('en', 'US'), const Locale('de', 'De')];
  static final menuItems = ['English', 'German'];
  static final localeIcons = ['uk.png', 'romania.png'];
  static final localeCodes = ['en_US', 'de_De'];

  // TODO: needs to use indexes instead of this
  static final localeSequence = [0, 1];
}
