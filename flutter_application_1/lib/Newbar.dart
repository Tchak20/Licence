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
              'assets/images/img.jpeg',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
             ),
             
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: NetworkImage(
                'data:image/jpeg;base64,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'
                ),
               fit: BoxFit.cover,),
            
          ),
          ),
          ListTile(
            leading: Icon(Icons.home) ,
            title: Text('Accueil'),
            onTap: () => null,
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