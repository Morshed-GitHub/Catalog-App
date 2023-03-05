import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/model/cart.dart';
import 'package:test_project/widgets/home_widgets/catalog_item.dart';
import 'package:test_project/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/products.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    final CartModel _item = (VxState.store as MyStore).cart;

    return context.isMobile // If screen/ canvas is in "Mobile" size then....
        ? ListView.builder(
            shrinkWrap:
                true, // If any scrollable thing inside column is present then 'shrinkWrap' must be true
            itemCount: Item.items.length,
            itemBuilder: (context, index) {
              // // getByPos()
              // final catalog = Item.getByPos(index);

              // getByID()
              // final catalog = Item.getByID(index +
              //     1); // As our productId starts from 1 but index starts from 0

              final catalog = Item.items[index];
              return CatalogItem(catalog: catalog);
            },
          )
        : GridView.builder(
            // If screen/ canvas is not in "Mobile" size (Just for test purpose)
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20),
            itemCount: Item.items.length,
            itemBuilder: (context, index) {
              final catalog = Item.items[index];
              return CatalogItem(catalog: catalog);
            });
  }
}
