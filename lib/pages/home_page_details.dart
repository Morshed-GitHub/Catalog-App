import 'package:flutter/material.dart';
import 'package:test_project/model/products.dart';
import 'package:test_project/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageDetails extends StatelessWidget {
  final Products catalog;

  const HomePageDetails({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    const String dummyText =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam odio arcu, elementum eget facilisis quis, dapibus id risus. Sed id neque risus. Donec et metus eu odio pretium semper. Nunc condimentum, ex vitae vehicula fringilla, diam enim vulputate odio, sit amet gravida justo turpis posuere ipsum. Nunc pretium convallis orci, quis blandit felis dapibus sit amet. Vestibulum malesuada a lacus sed elementum. Cras vitae fermentum ex, ac fringilla turpis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec pretium tincidunt nibh eget tristique. Duis eget aliquet metus. Suspendisse vulputate euismod diam, aliquam condimentum nisi pellentesque ut. Fusce vitae egestas urna. Nulla at ultrices turpis.";

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            backgroundColor: Colors.transparent,
          ),
          bottomSheet: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.xl2.red800.bold.make(),
              AddToCart(
                catalog: catalog,
              ).wh(130, 50)
            ],
          ).pSymmetric(v: 35, h: 30).color(Theme.of(context).cardColor),
          body: Column(
            children: [
              // Must be just inside of image widget to show image transition effect
              Hero(
                // In order to show photo transition effect
                tag: Key(
                    catalog.id.toString()), // connect two image widgets // must
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 50, // Ration of arcness
                  arcType: VxArcType
                      .CONVEY, // Two types: Convex(outside) & Convey(inside)
                  edge: VxEdge.TOP, // In which side you need arc
                  child: Container(
                    width: context.screenWidth,
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 60),
                      child: Column(
                        children: [
                          catalog.name.text
                              .color(
                                  Theme.of(context).appBarTheme.backgroundColor)
                              .xl4
                              .bold
                              .make(),
                          catalog.desc.text
                              .color(Theme.of(context)
                                  .appBarTheme
                                  .iconTheme!
                                  .color)
                              .caption(context)
                              .lg
                              .make(),
                          dummyText.text.justify
                              .caption(context)
                              .color(
                                  Theme.of(context).appBarTheme.backgroundColor)
                              .lg
                              .make()
                              .pSymmetric(v: 15, h: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
