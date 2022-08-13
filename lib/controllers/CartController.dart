import 'package:get/get.dart';
import 'package:getx_renshuu/models/cart.dart';

class CartController extends GetxController {
  var _carts = RxList<cart>.empty().obs;

  List<cart> get carts {
    return _carts.value;
  }

  addToCart(cart carts) {
    carts.total = carts.qty !* carts.items!.price!.toDouble();
    _carts.value.add(carts);
  }

  void removeFromCart(int id) {
    var _temp = _carts.value.where((index) => index.items!.id == id);
    _carts.value.remove(_temp);
  }

  double total(){
    double total = 0;
    return total;
  }
}
