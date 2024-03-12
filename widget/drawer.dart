import 'package:flutter/cupertino.dart';
import'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl="https://www.reddit.com/r/nattyorjuice/comments/14sgvvo/new_lean_beef_patty_post_it_could_be_lighting_but/?rdt=36291";
    return Drawer(
      child: ListView(
        padding:EdgeInsets.zero,
        children: [
          DrawerHeader(child: UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("Kajal Naik"),
            accountEmail:Text("@naikkajal0603@gmail.com"),
            currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),),
            ),),
          ListTile(
            leading: Icon(
             CupertinoIcons.home,
             color:Colors.black,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
              ),
          ),
          ListTile(
            leading: Icon(
             CupertinoIcons.profile_circled,
             color:Colors.black,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
              ),
          ),
          ListTile(
            leading: Icon(
             CupertinoIcons.mail,
             color:Colors.black,
            ),
            title: Text(
              "Email Me",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.white),
              ),
          )
        ],
    ),
    );
  }
}