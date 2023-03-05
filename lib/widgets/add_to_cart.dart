import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../model/cart.dart';
import '../model/products.dart';

class AddToCart extends StatelessWidget {
  final Products catalog;
  const AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [
      AddMutation,
      RemoveMutation
    ]); // Change reflect when element added & also when removing element from "cart" page

    bool _isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            Theme.of(context).floatingActionButtonTheme.backgroundColor),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!_isInCart) {
          // Condition checks if any "item" is added in "cart" page, then don't add this twice
          AddMutation(catalog);
        }
      },
      child: _isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
