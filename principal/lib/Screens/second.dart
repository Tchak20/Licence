import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/first.dart';
import 'package:flutter_application_1/Screens/liste_maladies.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/resultat.dart';
import 'package:flutter_application_1/Screens/select.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'Models/maladie.dart';
import 'Models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SecondPage extends StatefulWidget {
  final int numberOfFields;

  SecondPage(this.numberOfFields);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> _fieldValues = [];
  int _currentIndex = 0;

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
    _fieldValues = List.filled(widget.numberOfFields, '');
  }

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Symptômes'),
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
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            shadowColor: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.fromLTRB(16, 50, 16, 20),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.jpeg',
                    width:
                        200, // Changer la valeur pour ajuster la taille de l'image
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < widget.numberOfFields; i++)
                          Padding(
                            padding: EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Veuillez entrer une valeur';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  _fieldValues[i] = value!;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: 'Symptôme ${i + 1}',
                                prefixIcon: Icon(Icons.numbers),
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 74, 71, 71),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 74, 71, 71)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
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
                                    builder: (context) =>
                                        Home(cardTitles: _fieldValues),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text('Diagnostics'),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
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
