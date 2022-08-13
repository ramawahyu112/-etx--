import 'package:flutter/material.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_renshuu/controllers/CartController.dart';
import 'package:getx_renshuu/controllers/ProductController.dart';
import 'package:getx_renshuu/models/cart.dart';
import 'package:getx_renshuu/screens/WishListScreen.dart';

class HomeScreen extends StatelessWidget {
  final ProductController _p = Get.put(ProductController());
  final CartController _cartController = Get.put(CartController());
  var qty = 0.obs;
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Obx(() =>
                  Text('wish'.tr + ' : ' + _p.wishListItems.length.toString())),
            ),
            onTap: () {
              Get.toNamed('/wishlist');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Obx(() => Text(
                  'cart'.tr + ' : ' + _cartController.carts.length.toString())),
            ),
            onTap: () {
              Get.toNamed('/cart');
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text('Change Language'),
            ),
            onTap: () {
              var currentLocale = Get.locale;
              var localeJP = Locale('ja', 'JP');
              var locale = Locale('en', 'US');
              if (currentLocale == locale) {
                Get.updateLocale(localeJP);
              } else {
                Get.updateLocale(locale);
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: _p.items.length,
            itemBuilder: (context, index) {
              final product = _p.items[index];
              return InkWell(
                child: Card(
                    key: ValueKey(product.id),
                    margin: EdgeInsets.all(5),
                    color: Colors.amber,
                    child: ListTile(
                      title: Text(product.name.toString()),
                      subtitle: Text("\$${product.price!.toStringAsFixed(2)}"),
                      trailing: Obx(
                        () => IconButton(
                            onPressed: () {
                              if (product.inWishList == false) {
                                _p.addItem(product.id!.toInt());
                              } else {
                                _p.removeItem(product.id!.toInt());
                              }
                            },
                            icon: Icon(Icons.favorite,
                                color: product.inWishList!.value == false
                                    ? Colors.white
                                    : Colors.red)),
                      ),
                    )),
                onTap: () {
                  Get.defaultDialog(
                      title: "Add Item To Cart",
                      content: Column(
                        children: [
                          CupertinoSpinBox(
                              min: 1,
                              max: 100,
                              value: 0,
                              onChanged: (value) =>
                                  {qty.value = value.toInt()}),
                          IconButton(
                              onPressed: () => {
                                    _cartController.addToCart(
                                      cart(
                                          items: product,
                                          qty: qty.toDouble(),
                                          total: 0),
                                    ),
                                  },
                              icon: Icon(Icons.save_alt_rounded)),
                        ],
                      ),
                      actions: [
                        FlatButton(
                            onPressed: () => Get.back(), child: Text('Close')),
                      ]);
                },
              );
              ;
            },
          ))
        ],
      ),
    );
  }
}
