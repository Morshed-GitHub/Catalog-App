import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/model/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).appBarTheme.backgroundColor,
        ),
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartItems().p32().expand(),
          Divider(
            color: Theme.of(context).appBarTheme.backgroundColor,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _Cart = (VxState.store as MyStore).cart;

    // Here only changes, the "price" tag. So why to refresh the whole widget tree?
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VxConsumer(
            // Wrap with "VxConsumer"
            builder: (context, dynamic, _) => // return widget
                "\$${_Cart.totalPrice}"
                    .text
                    .xl3
                    .color(Theme.of(context).appBarTheme.backgroundColor)
                    .make(),

            // Price will be added automatically, so no need to "watch" on "AddMutation"
            mutations: const {RemoveMutation}, // Contains "Set<Type>"
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
                ),
                shape: MaterialStateProperty.all(
                  const StadiumBorder(),
                )),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying option is not ready yet.".text.make(),
              ));
            },
            child: "Buy".text.lg.bold.white.make(),
          ).wh(150, 50)
        ],
      ).p32(),
    );
  }
}

class _CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [RemoveMutation]); // Recalls the build() method

    return _cart.items.isEmpty
        ? "Nothing To Show".text.white.xl3.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                iconColor: Theme.of(context).appBarTheme.backgroundColor,
                leading: const Icon(Icons.done),
                trailing: IconButton(
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                title: _cart.items[index].name.text
                    .color(Theme.of(context).appBarTheme.backgroundColor)
                    .make(),
              );
            },
          );
  }
}
