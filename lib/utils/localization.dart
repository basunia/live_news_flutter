import 'dart:ui';

extension MenuItemsFilter<E> on Iterable<E> {
  E get localeUK => first;
  E get localeRomania => last;
}

class Localization {
  static final locales = [const Locale('en', 'US'), const Locale('bn', 'BD')];
  static final menuItems = ['English', 'Bengali'];
  static final localeIcons = ['uk.png', 'romania.png'];
  static final localeCodes = ['en_US', 'bn_BD'];

  // TODO: needs to use indexes instead of this
  static final localeSequence = [0, 1];
}
