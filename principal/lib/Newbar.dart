import 'package:flutter/material.dart';
 
 class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
          accountName: Text('TCHAKOURA Bastou'), 
          accountEmail: Text('tchakourabastou@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
             child: Image.asset(
              "images/doctor2.jpeg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
             ),
             
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage(
                "images/plante2.jpg"),
               fit: BoxFit.cover,),
            
          ),
          ),

           ListTile(
            leading: Icon(Icons.medical_services) ,
            title: Text('Diagnostic'),
            onTap: () => null,
          ),
           ListTile(
            leading: Icon(Icons.nature) ,
            title: Text('Plantes'),
            onTap: () => null,
          ),
           ListTile(
            leading: Icon(Icons.list) ,
            title: Text('Historique'),
            onTap: () => null,
          ),
           ListTile(
            leading: Icon(Icons.logout) ,
            title: Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}