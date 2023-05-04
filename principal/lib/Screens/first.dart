import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/liste_maladies.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/second.dart';
import 'package:flutter_application_1/Screens/second.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'Models/maladie.dart';
import 'Models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  int _numberOfFields = 3;

  bool _isLoading = false;
  int _currentIndex = 0;

  void _showLoadingIndicator() {
    setState(() {
      _isLoading = true;
    });
  }

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _hideLoadingIndicator() {
    setState(() {
      _isLoading = false;
    });
  }

  Future<User> getUserById(int id) async {
    final userUrl = Uri.parse('http://127.0.0.1:8000/api/user/$id');
    final response = await http.get(userUrl);
    final body = json.decode(response.body);
    return User.fromJson(body);
  }

  String name = '';
  String email = '';
  int myValue = SharedPreferencesHelper.prefs?.getInt('id') ?? 1;
  getUser() async {
    final user = await getUserById(myValue);
    setState(() {
      name = user.nom;
      email = user.email;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

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
                accountName: Text(name),
                accountEmail: Text(email),
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
                  setCurrentIndex(1);
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Liste()));
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
                  setCurrentIndex(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              'images/logo.jpeg',
              width: 200, // Ajuster la taille de l'image ici
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Svp entrez un nombre';
                      }
                      int? n = int.tryParse(value);
                      if (n == null) {
                        return 'entrez un nombre valide';
                      }
                      if (n < 3 || n > 6) {
                        return 'Entrer un nombre entre 3 and 6';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _numberOfFields = int.parse(value!);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Entrer un nombre',
                      labelText: 'Nombre de Symptomes (3 à 6)',
                      prefixIcon: Icon(Icons.numbers),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 74, 71, 71),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 74, 71, 71),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(_numberOfFields),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Envoyer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        primary: Color.fromARGB(255, 74, 71, 71),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
