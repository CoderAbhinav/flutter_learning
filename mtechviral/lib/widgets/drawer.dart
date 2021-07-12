import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mtechviral/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imgURL =
        "https://media-exp3.licdn.com/dms/image/C5603AQFUSMy4sOYlBA/profile-displayphoto-shrink_200_200/0/1622083061449?e=1629936000&v=beta&t=H6hxv26O4SXgU02EPBISoQMxcG9P3kw1CyiCcxXxkB4";

    return Drawer(
        child: Container(
      color: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Abhinav Belhekar"),
                accountEmail: Text("abhinav.22010389@viit.ac.in"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imgURL),
                ),
              )),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.backward_end,
              color: Colors.white,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    ));
  }
}
