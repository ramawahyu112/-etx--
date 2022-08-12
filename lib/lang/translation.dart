import 'package:get/get.dart';

class translation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello World',
          'wish': 'Wish List Screen',
          'home': 'Home Screen',
          'product': 'Product',
          'cart': 'Cart',
        },
        'ja_JP': {
          'hello': 'おはよう',
          'wish': 'おねがい　Screen',
          'home': 'さいしょう　Screen',
          'product': 'ばななな',
          'cart': 'Cart',

        }
      };
}
