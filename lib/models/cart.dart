import 'package:get/get.dart';

import 'package:getx_renshuu/models/item.dart';

class cart {
  item? items;
  double? qty;
  double? total;

  cart({
    required this.items,
    required this.qty,
    required this.total,
  });
  
}
