import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_renshuu/controllers/ProductController.dart';

class WishListScreen extends StatelessWidget {
  final ProductController _p = Get.find<ProductController>();
   WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('wish'.tr),),
      body: Obx(
        () => ListView.builder(itemBuilder: (context, index) {
          final item = _p.wishListItems[index];
           return Card(
                key: ValueKey(item.id),
                margin: EdgeInsets.all(5),
                color: Colors.blue[200],
                child: ListTile(
                  title: Text(item.name.toString()),
                  subtitle: Text("\$${item.price!.toStringAsFixed(2)}"),
                  trailing: IconButton(onPressed: () {
                   item.inWishList!.value = false;
                   _p.removeItem(item.id!.toInt());
                  }, icon: Icon(Icons.close)),
                ),
              );
        },itemCount: _p.wishListItems.length,),
      ),
    );
  }
}