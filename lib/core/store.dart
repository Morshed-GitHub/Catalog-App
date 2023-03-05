import 'package:test_project/model/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/products.dart';

class MyStore extends VxStore {
  late CartModel cart;
  late Item item;

  MyStore() {
    cart = CartModel();
    item = Item();
    cart.item = item;
  }
}


