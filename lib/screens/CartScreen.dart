import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_renshuu/controllers/CartController.dart';

class CartScreen extends StatelessWidget {
  CartController _cartController = Get.find<CartController>();
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'.tr),
      ),
      body: Obx(() => ListView.builder(itemBuilder: (context, index) {
        var item = _cartController.carts[index];
        return Column(
          children: [
            Card(
              color: Colors.cyanAccent[200],
              child: ListTile(
                title: Text(item.items!.name.toString()),
                subtitle: Text(item.items!.price.toString()),
                leading: Text('X ${item.qty}'),
                trailing: Text(item.total.toString(),style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.green[200],
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: ListTile(
                  title: Text('total'.tr),
                  trailing: Text(_cartController.total().toString()),
                ),
              ),
            )
          ],
        );
      }, itemCount: _cartController.carts.length ,)),
    );
  }
}