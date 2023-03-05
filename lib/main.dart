import 'package:flutter/material.dart';
import 'package:test_project/core/store.dart';
import 'package:test_project/pages/cart_page.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/login_page.dart';
import 'package:test_project/utils/routes.dart';
import 'package:test_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

// A function is a group of command's
void main() {
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override // Must have to override this method in your inherited class - abstract function concept
  Widget build(BuildContext context) {
    // 'context' hold's the address/ location of the widget's. Series of widget's are present here & 'context' remember the sequence (1<->2<->3<->4.....)
    bringVegetables(handBag: true);
    return MaterialApp(
      title: "Catalog App",
      debugShowCheckedModeBanner: false,
      // home: HomePage(), // Only one declaration either from 'home' or 'routes'
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(),
      darkTheme: MyTheme
          .darkTheme(), // Comment this in order to see the changes of lightTheme

      // We did hard code here below,
      // initialRoute:
      //     "/login", // if we want to set any page on the opening screen
      // routes: {
      //   "/": (context) => const HomePage(),
      //   "/login": (context) => const LoginPage(),
      //   "/home": (context) => const HomePage(),

      // Instead, we can use this method of 'MyRoutes' class....
      initialRoute:
          // "/login", // if we want to set any page on the opening screen
          "/home",

      routes: {
        // "/": (context) => const HomePage(),
        "/": (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }

  // Method - A function inside class is called method
  bringVegetables({required bool handBag, int rupees = 100}) {
    // 'required' keyword is used when we want to force the user to pass this argument
    // Named parameter's are written inside the {} curly braces

    // step 1: Take money
    // step 2: Go to sector 16
  }
}
