import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/first.dart';
import 'package:flutter_application_1/Screens/liste_maladies.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'package:flutter_application_1/Screens/login_page.dart';

class MyHomePage extends StatelessWidget {
  int _currentIndex = 0;
  final String? name = SharedPreferencesHelper.nom;
  final String? email = SharedPreferencesHelper.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Nombre de Symptômes'),
          backgroundColor: Color.fromRGBO(216, 14, 91, 0.685)),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/back.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/back.jpeg'), // Chemin de l'image
                    fit: BoxFit
                        .cover, // Ajuste l'image pour couvrir tout l'espace disponible
                  ),
                ),
                accountName: Text(name!),
                accountEmail: Text(email!),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/logo.jpeg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.medical_services,
                    color: Color.fromRGBO(216, 14, 91, 0.685)),
                title: Text('Maladies',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Liste()));
                },
              ),
              ListTile(
                leading: Icon(Icons.search,
                    color: Color.fromRGBO(216, 14, 91, 0.685)),
                title: Text('Rechercche par Symptômes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,
                    color: Color.fromRGBO(216, 14, 91, 0.685)),
                title: Text('Déconnexion',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  SharedPreferencesHelper.prefs?.setInt('id', 0);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage2()));
                },
              ),
              ListTile(
                leading: Icon(Icons.monetization_on,
                    color: Color.fromRGBO(216, 14, 91, 0.685)),
                title: Text('Faire un don',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Card(
            margin: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 50, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Aucune Maladie trouvée'),
                  SizedBox(height: 32),
                  SizedBox(
                    width: 120,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FirstPage(),
                          ),
                        );
                      },
                      child: Text('Retour'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
