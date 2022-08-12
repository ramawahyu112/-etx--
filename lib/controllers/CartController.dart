import 'package:get/get.dart';
import 'package:getx_renshuu/models/cart.dart';

class CartController extends GetxController {
  RxList<cart>? _carts;

  List<cart> get carts {
    return _carts!.toList();
  }

  void addToCart(cart carts) {
    carts.total = carts.qty !* carts.items!.price!.toDouble();
    _carts!.add(carts);
  }

  void removeFromCart(int id) {
    var _temp = _carts!.where((index) => index.items!.id == id);
    _carts!.remove(_temp);
  }

  double total(){
    double total = 0;
    return total;
  }
}
