import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Colors.dart';
import 'package:flutter_application_1/Screens/Colors.dart';
import 'package:flutter_application_1/Screens/first.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/recherche.dart';
import 'package:flutter_application_1/Screens/select.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../Services/apiServices.dart';
import 'Colors.dart';
import 'Models/maladie.dart';
import 'Models/user.dart';

class Liste extends StatefulWidget {
  const Liste({
    Key? key,
  }) : super(key: key);

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Maladie> listOfUser = [];
  List<Maladie>? listOfUsersFiltered;
  bool isLoading = false;
  String? errorMessage;

  Future<List<dynamic>> fetchMaladies() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/maladies'));

    if (response.statusCode == 200) {
      // Convertir la réponse JSON en un objet List<dynamic>
      List<dynamic> maladies = jsonDecode(response.body);
      return maladies;
    } else {
      throw Exception('Impossible de récupérer les maladies depuis l\'API');
    }
  }

  Future<User> getUserById(int id) async {
    final userUrl = Uri.parse('http://127.0.0.1:8000/api/user/$id');
    final response = await http.get(userUrl);
    final body = json.decode(response.body);
    return User.fromJson(body);
  }

  String name = '';
  final _searchController = TextEditingController();
  String email = '';
  int myValue = SharedPreferencesHelper.prefs?.getInt('id') ?? 0;
  void out(int id) {
    if (id == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInPage2()));
    }
  }

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
    fetchMaladies().then((maladies) {
      setState(() {
        out(myValue);
        getUser();
        listOfUser = maladies.map((m) => Maladie.fromJson(m)).toList();
        listOfUser.sort((a, b) =>
            a.nom_maladie.toUpperCase().compareTo(b.nom_maladie.toUpperCase()));
      });
    }).catchError((error) {
      if (mounted) {
        setState(() {
          errorMessage = error.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> firstLetters = [];
    int myValue = SharedPreferencesHelper.prefs?.getInt('id') ?? 0;
    if (myValue == 0) {}
    getUserById(myValue).then((user) {
      final String name = user.nom;
      final String email = user.email;
      SharedPreferencesHelper.nom = name;
      SharedPreferencesHelper.email = email;
    });

// Créer une liste de lettres correspondant aux premières lettres de chaque maladie
    for (Maladie maladie in listOfUser) {
      String firstLetter = maladie.nom_maladie.substring(0, 1);
      if (!firstLetters.contains(firstLetter)) {
        firstLetters.add(firstLetter);
      }
    }

// Trier la liste de lettres par ordre alphabétique
    firstLetters.sort();

    return Scaffold(
      appBar: AppBar(
          title: Text('Liste des Maladies'),
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
                  Navigator.pop(context);
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
      body: Center(
        child: errorMessage != null
            ? Text(errorMessage!)
            : listOfUser.isEmpty
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Chercher une maladie...',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Color.fromRGBO(216, 14, 91, 0.685),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Search(
                                          query: _searchController.text,
                                          maladies: listOfUser
                                          //searchQuery: _searchController.text,
                                          ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // Afficher la liste de lettres
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: firstLetters.length,
                          itemBuilder: (BuildContext context, int index) {
                            String letter = firstLetters[index];
                            // Filtrer la liste de maladies pour cette lettre
                            List<Maladie> maladiesForLetter = listOfUser
                                .where((maladie) => maladie.nom_maladie
                                    .toLowerCase()
                                    .startsWith(letter.toLowerCase()))
                                .toList();
                            return maladiesForLetter.isEmpty
                                ? SizedBox.shrink()
                                : Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          letter.toUpperCase(),
                                          style: TextStyle(
                                            color: bColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      // Afficher la liste de maladies pour cette lettre
                                      ...maladiesForLetter.map((maladie) =>
                                          Card(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: ListTile(
                                                      leading: Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image.asset(
                                                            maladie.image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        maladie.nom_maladie,
                                                        style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              216,
                                                              14,
                                                              91,
                                                              0.685),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                CardDetails(
                                                                    maladie:
                                                                        maladie),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons.remove_red_eye,
                                                        color: Color.fromRGBO(
                                                            216,
                                                            14,
                                                            91,
                                                            0.685)),
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              CardDetails(
                                                            maladie: maladie,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ],
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}

class SearchPage {}
