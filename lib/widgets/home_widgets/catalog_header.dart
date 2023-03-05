import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App"
          .text
          .xl5
          .color(Theme.of(context).appBarTheme.backgroundColor)
          .bold
          .make(),
      "Trending Products"
          .text
          .color(Theme.of(context).appBarTheme.backgroundColor)
          .xl2
          .make(),
    ]);
  }
}
