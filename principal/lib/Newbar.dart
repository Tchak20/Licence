import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/diagnostic_page.dart';
import 'package:flutter_application_1/Screens/home_pages.dart';
import 'package:flutter_application_1/Screens/plantes_page.dart';
import 'package:flutter_application_1/Screens/proceder_page.dart';
 
 class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
        padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
          accountName: const Text('TCHAKOURA Bastou'), 
          accountEmail: const Text('tchakourabastou@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
             child: Image.asset(
              "images/profil.jpeg",
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
                "images/back.jpeg"),
               fit: BoxFit.cover,),
            
          ),
          ),
          
           ListTile(
            leading: Icon(Icons.medical_services, color: Colors.blue,) ,
            title: Text('Diagnostic'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>HomePage()
                    ));
            },
          ),
           ListTile(
            leading: Icon(Icons.nature, color: Colors.blue) ,
            title: Text('Plantes'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>PlantesScreen()
                    ));
            },
          ),
           ListTile(
            leading: Icon(Icons.menu_book_outlined, color: Colors.blue) ,
            title: Text('Procédés'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>ProcederScreen()
                    ));
            },
          ),
           ListTile(
            leading: Icon(Icons.list, color: Colors.blue) ,
            title: Text('Historique'),
            onTap: () {
             /* Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>SignInPage2()
                    ));
            */},
          ),
           ListTile(
            leading: Icon(Icons.logout, color: Colors.blue) ,
            title: Text('Logout'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}