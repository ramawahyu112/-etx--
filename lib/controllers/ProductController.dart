import 'dart:math';

import 'package:get/get.dart';
import '../models/item.dart';

class ProductController extends GetxController {
  final RxList<item> _items = List.generate(
      100,
      (index) => item(
          id: index,
          name: 'product ${index}',
          price: Random().nextDouble() * 100,
          inWishList: false.obs)).obs;

  List<item> get items {
    return [..._items];
  }

  List<item> get wishListItems {
    return _items.where((item) => item.inWishList!.value == true).toList();
  }

  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList!.value = true;
  }

  void removeItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList!.value = false;
  }
}
