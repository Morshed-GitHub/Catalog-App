import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/model/cart.dart';
import 'package:test_project/model/products.dart';
import 'package:test_project/utils/routes.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

// In order to get 'rootBundle' functionality
import 'package:flutter/services.dart';

// In order to get 'jsonDecode' functionality
import 'dart:convert';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "";

  @override
  void initState() {
    // In order to get data before calling 'build' method
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(const Duration(
    //     seconds: 2)); // In order to check error of initial empty list 'item'

    final productsJson =
        await rootBundle.loadString("assets/files/products.json");
    // 'productsJson' is in String format, so that we have decode this into 'Map' format

    // // "HTTP" API Call Process
    // final response = await http.get(Uri.parse(url));
    // final productsJson = response.body;

    // Note: JsonEncode -> "Encoding into String from another type like Map", JsonDecode -> "Decoding from String into other type like Map"
    final decodedData = jsonDecode(productsJson); // In Map format
    final productsData = decodedData["products"];

    // In this step, we need data in form of 'List', so..
    // List<Products?> productsList = // <xxx?> -> ? is used for null safety
    Item.items =
        List.from(productsData) // 'Item.items' is same as List<Products>
            .map((index) => Products.fromMap(index))
            .toList();

    // Now in order to see changes, we have to call setState((){}) method
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,

      // "VxBuilder" -> In order to refresh only specific "widget" not the whole "widget tree"
      floatingActionButton: const CartFloatingButton(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (Item.items.isNotEmpty)
                const CatalogList()
                    .py16()
                    .expand() // expand until it found anything or possible as much as
              else
                CircularProgressIndicator(
                  color: MyTheme.darkBluishColor,
                )
                    .centered()
                    .expand(), // expand until it found anything or possible as much as
            ],
          ),
        ),
      ),
    );
  }
}

class CartFloatingButton extends StatelessWidget {
  const CartFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting instance/ object of "CartModel" from store
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool _isCartEmpty = _cart.items.isEmpty;

    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return _isCartEmpty
        ? cartButton(context)
        : cartButton(context).badge(
            color: Theme.of(context).cardColor,
            size: 25,
            textStyle: TextStyle(
              color: Theme.of(context).appBarTheme.backgroundColor,
              fontWeight: FontWeight.bold,
            ),
            count: _cart.items.length,
          );
  }

  FloatingActionButton cartButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),
      child: const Icon(CupertinoIcons.cart),
    );
  }
}
