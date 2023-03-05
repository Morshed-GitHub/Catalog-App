import 'package:flutter/material.dart';
import 'package:test_project/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isLoginButtonPressed = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // if form field are ok then..... otherwise exception
      // In order to use future
      setState(() {
        // isLoginButtonPressed =
        //     !isLoginButtonPressed; // NOT Gate (true <-> false)
        isLoginButtonPressed = true;
      });
      await Future.delayed(const Duration(
          milliseconds:
              700)); // duration of changing 'longin page' to 'home page'

      // if we don't add 'await', then it doesn't show animation effect on closing
      await Navigator.of(context).pushNamed(MyRoutes.homeRoute);
      setState(() {
        isLoginButtonPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Note: Size properties of a widget depend's on the fixed properties of the root widget
                // Container(
                //   constraints: const BoxConstraints(
                //     minHeight: **,
                //     maxWidth: **,
                // child: Widget(),
                //   ),
                // ),

                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  // height: 1000,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("Welcome $name",
                    style: TextStyle(
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter Email",
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).appBarTheme.iconTheme!.color,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color:
                                Theme.of(context).appBarTheme.iconTheme!.color,
                          ),
                        ),
                        onChanged: (value) {
                          // In order to refresh, have to recall the build method
                          // build(context); // Wrong way to recall build(context)
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password can't be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
                        style: TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).appBarTheme.iconTheme!.color,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color:
                                Theme.of(context).appBarTheme.iconTheme!.color,
                          ),
                        ),
                        obscureText: true,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),

                // Custom Created Button
                Material(
                  // In order to fix the splashColor showing issue
                  color: Theme.of(context)
                      .floatingActionButtonTheme
                      .backgroundColor,

                  // Two borderRadius: In order to match the splashColor with the AnimatedContainer
                  borderRadius:
                      BorderRadius.circular(isLoginButtonPressed ? 50 : 8),
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(isLoginButtonPressed ? 50 : 8),

                    // splash color won't work, this will show in background. In order to fix that...
                    //    (i) Choose Ink() in the child & remove ......
                    //   (ii) Wrap InkWell() with Material and remove all the decoration & Color properties from below part. Change on Material part only.
                    splashColor: Colors.deepPurple[500],
                    onTap: () => moveToHome(
                        context), // Fat Arrow also called short hand arrow
                    child: AnimatedContainer(
                      // 'AnimatedContainer' to get basic animation effect
                      duration: const Duration(
                          milliseconds:
                              700), // duration of changing container width
                      height: 50,
                      width: isLoginButtonPressed
                          ? 60
                          : 150, // Conditional Statement -> [(Condition) ? true : false]
                      decoration: const BoxDecoration(
                          //   shape: isLoginButtonPressed
                          //       ? BoxShape.circle
                          //       : BoxShape.rectangle,
                          ),
                      alignment: Alignment.center,
                      child: isLoginButtonPressed
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
