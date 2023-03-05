import 'package:flutter/material.dart';
import 'package:test_project/pages/home_page_details.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/products.dart';
import '../add_to_cart.dart';
import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Products catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: InkWell(
      onTap: () async {
        // Navigator.of(context).pushNamed("/details"); // This won't work cause 'homePageDetails' required 'Product' object. so we have to use
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                // HomePageDetails(catalog: Item.getByID(5)))); // Item.getByID(id) -> In order to use specific id page
                HomePageDetails(catalog: catalog)));
      },
      child: Row(
        children: [
          Hero(
              // In order to apply 'Hero' effect directly on image
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          15.widthBox,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalog.name.text.lg
                    .color(Theme.of(context)
                        .floatingActionButtonTheme
                        .backgroundColor)
                    .bold
                    .make(),
                catalog.desc.text
                    .caption(context)
                    .color(
                      Theme.of(context).appBarTheme.backgroundColor,
                    )
                    .make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .color(Theme.of(context).appBarTheme.backgroundColor)
                        .lg
                        .bold
                        .make(),
                    AddToCart(
                      catalog: catalog,
                    ).h4(context),
                  ],
                ).pOnly(right: 8)
              ],
            ).pOnly(right: 8.0),
          )
        ],
      ),
    ))
        .square(150)
        .p8
        .roundedSM
        .color(Theme.of(context).cardColor)
        .make()
        .py12();
  }
}

