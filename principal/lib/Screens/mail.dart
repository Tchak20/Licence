import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/first.dart';
import 'package:flutter_application_1/Screens/liste_maladies.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/message.dart';
import 'package:flutter_application_1/Screens/page.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'package:flutter_application_1/Screens/mail.dart';
import 'package:flutter_application_1/Screens/select.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter_application_1/Screens/controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';
import '../Services/apiServices.dart';
import 'package:share/share.dart';
import 'Models/maladie.dart';

class EmailFormPage extends StatefulWidget {
  final Maladie maladie;

  EmailFormPage({required this.maladie});

  @override
  _EmailFormPageState createState() => _EmailFormPageState();
}

class _EmailFormPageState extends State<EmailFormPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String? name = SharedPreferencesHelper.nom;
  final String? email = SharedPreferencesHelper.email;
  Future<Map<String, dynamic>> mail(
      String email, String maladie, String symptomes, String nom) async {
    final response = await http.get(Uri.parse(
        'https://enuretic-contracts.000webhostapp.com/crud/test.php?email=$email&maladie=$maladie&symptomes=$symptomes&nom=$nom'));

    if (response.statusCode == 200) {
      // Convertir la réponse JSON en un objet Map<String, dynamic>
      final Map<String, dynamic> msg = jsonDecode(response.body);
      print(msg['success']);
      if (msg['success']) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert !'),
              content: Text('Partager avec Succès'),
              actions: [
                TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardDetails(
                            maladie: widget.maladie,
                          ),
                        ))),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert !'),
              content: Text('Erreur de partage'),
              actions: [
                TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailFormPage(
                            maladie: widget.maladie,
                          ),
                        ))),
              ],
            );
          },
        );
      }
      return msg;
    } else {
      throw Exception('Impossible de récupérer hostiger');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Partage du Diagnostic'),
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Card(
          margin: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image.asset(
                'images/gmail.png',
                width: 100.0,
                height: 100.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email du destinataire',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    RegExp emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                    if (value == null || value.isEmpty) {
                      return 'Veuillez saisir une adresse email';
                    } else if (!emailRegex.hasMatch(value)) {
                      return 'Veuillez saisir une adresse email valide';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              IconButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String email = _emailController.text;
                    mail(email, widget.maladie.nom_maladie,
                        widget.maladie.symptomes, name!);
                  }
                },
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.share, color: Color.fromARGB(255, 218, 6, 6)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
