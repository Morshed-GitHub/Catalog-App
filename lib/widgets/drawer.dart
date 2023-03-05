import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://scontent.fdac80-1.fna.fbcdn.net/v/t39.30808-6/319207161_2411222342373481_1393124678582657227_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_3swtPeNtJkAX8FVzew&_nc_ht=scontent.fdac80-1.fna&oh=00_AfAlv8PciQhV8S852676InwnttBAsOdxu--iLlcmSK8MvQ&oe=63ED9E0A";
    return Drawer(
      backgroundColor: Colors.deepPurple[500],
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            accountName: const Text(
              "Margub Morshed",
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text(
              "engr.morshed.cse@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          ListTile(
            onTap: () => Navigator.of(context).pop(),
            splashColor: Colors.deepPurple[800],
            leading: const Icon(CupertinoIcons.home, color: Colors.white),
            title: const Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.1,
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.profile_circled, color: Colors.white),
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.1,
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.bolt_horizontal_circle,
                color: Colors.white),
            title: Text(
              "Send Message",
              style: TextStyle(
                color: Colors.white,
              ),
              textScaleFactor: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
