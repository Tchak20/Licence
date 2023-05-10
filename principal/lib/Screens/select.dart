import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/first.dart';
import 'package:flutter_application_1/Screens/liste_maladies.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/message.dart';
import 'package:flutter_application_1/Screens/page.dart';
import 'package:flutter_application_1/Screens/controller.dart';
import 'package:flutter_application_1/Screens/mail.dart';
import 'package:flutter_application_1/Services/apiServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_share/flutter_share.dart';
import '../Services/apiServices.dart';
import 'package:share/share.dart';
import 'Models/maladie.dart';
import 'Models/fiche.dart';

class Home extends StatefulWidget {
  final List<String> cardTitles;
  const Home({Key? key, required this.cardTitles}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final String? name = SharedPreferencesHelper.nom;
  final String? email = SharedPreferencesHelper.email;
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

  void verif(List<Maladie> dise) {
    if (dise.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AutrePage(maladies: dise),
        ),
      );
    }
  }

  String normalizeAndLowercase(String str) {
    String normalizedStr = str
        .replaceAll(RegExp('[éèêë]'), 'e')
        .replaceAll(RegExp('[àâä]'), 'a')
        .replaceAll(RegExp('[îï]'), 'i')
        .replaceAll(RegExp('[ôö]'), 'o')
        .replaceAll(RegExp('[ûü]'), 'u')
        .replaceAll(RegExp('[ç]'), 'c')
        .replaceAll(RegExp('[^a-zA-Z0-9 ]'), '');

    return normalizedStr.toLowerCase();
  }

  @override
  void initState() {
    super.initState();
    fetchMaladies().then((maladies) {
      setState(() {
        listOfUser = maladies.map((m) => Maladie.fromJson(m)).toList();
        List<Maladie> maladiesFiltered = [];
        for (Maladie maladie in listOfUser) {
          int count = 0;
          for (String titre in widget.cardTitles) {
            if (normalizeAndLowercase(maladie.symptomes)
                .contains(normalizeAndLowercase(titre))) {
              count++;
            }
          }
          if (count > 0) {
            maladie.count = count;
            maladiesFiltered.add(maladie);
          }
        }
        verif(maladiesFiltered);
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnostic'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name!),
              accountEmail: Text(email!),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/logo.jpeg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Maladies'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Liste()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Rechercche par symptomes'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Faire un don'),
              onTap: () {
                setCurrentIndex(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Recherche en cours ...'),
          ],
        ),
      ),
    );
  }

// Vérifier s'il y a des maladies à afficher
}

class CardDetails extends StatefulWidget {
  final Maladie maladie;
  final String? name = SharedPreferencesHelper.nom;
  final String? email = SharedPreferencesHelper.email;
  CardDetails({Key? key, required this.maladie}) : super(key: key);

  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final ScrollController _scrollController = ScrollController();
  final _emailController = TextEditingController();
  late Fiche _fiche =
      Fiche(id: 0, maladies_id: 0, traitements: '', prevention: '', autres: '');

  @override
  void initState() {
    super.initState();
    fetchFiche(widget.maladie.id);
  }

  Future<void> fetchFiche(int id) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/fiche/$id'));
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final fiche = Fiche.fromJson(jsonMap);
      setState(() {
        _fiche = fiche;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String? name = SharedPreferencesHelper.nom;
    final String? email = SharedPreferencesHelper.email;
    return Scaffold(
      appBar: AppBar(
          title: Text('Fiche Maladie'),
          actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
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
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image(
                          image: NetworkImage(
                              'http://127.0.0.1:8000/storage/${widget.maladie.image}'),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 70,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          widget.maladie.nom_maladie,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(216, 14, 91, 0.685),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(widget.maladie.description),
                    ], 
                  ),
                ),
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Symptômes',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            widget.maladie.symptomes.split(",").map((phrase) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_right),
                              SizedBox(width: 10),
                              Expanded(child: Text(phrase)),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Traitements',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _fiche.traitements.split(",").map((phras) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_right),
                              SizedBox(width: 10),
                              Expanded(child: Text(phras)),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Préventions',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _fiche.prevention.split(",").map((phrasee) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_right),
                              SizedBox(width: 10),
                              Expanded(child: Text(phrasee)),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Plus d\'informations',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(_fiche.autres),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EmailFormPage(maladie: widget.maladie)));
        },
        child: Icon(
          Icons.share,
          color: Color.fromRGBO(216, 14, 91, 0.685),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
