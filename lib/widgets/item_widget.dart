import 'package:flutter/material.dart';
import 'package:test_project/model/products.dart';

class ItemWidget extends StatelessWidget {
  final Products item;

  const ItemWidget({super.key, required this.item});
  // : assert(item != null); // 'assert': In order to use condition & check it on debug mode

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Card(
        elevation: 5,
        shadowColor: Colors.deepPurple[500],
        child: ListTile(
          title: Text(
            item.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(
                color: Colors.deepPurple[
                    500]), // Compiler get's confused by '$$', so we have to use '\$$'
            textScaleFactor: 1.8,
          ),
          leading: Image.network(item.image),
        ),
      ),
    );
  }
}
