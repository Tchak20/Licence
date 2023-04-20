import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../Services/apiServices.dart';
import 'Models/maladie.dart';

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

  List<Maladie> listOfUser = [];
  List<Maladie>? listOfUsersFiltered;
  bool isLoading = false;
  String? errorMessage;

  Future<List<Maladie>> getUsers() async {
    setState(() {
      isLoading = true;
    });
    const phpURL = 'http://127.0.0.1:8000/api/users'; // URL of your PHP file
    final response = await http.get(Uri.parse(phpURL));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      setState(() {
        errorMessage = null;
      });
      dynamic data = response.body;
      List<dynamic> list = jsonDecode(data);

      listOfUser = Maladie.fromJsonList(list);
      print(listOfUser);
      if (widget.cardTitles.isNotEmpty) {
        listOfUsersFiltered = listOfUser
            .where((uses) => widget.cardTitles.contains(uses.symptomes.toString()))
            .toList();
      } else {
        listOfUsersFiltered = listOfUser;
      }
      print(response.statusCode);
      print(listOfUsersFiltered);
      return listOfUsersFiltered!;
    } else {
      setState(() {
        errorMessage = "Une erreur interne est survenue";
      });
      throw Exception(
          'Erreur de chargement des catégories depuis la base de données.');
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste d\'utilisateurs'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : errorMessage != null
              ? Center(
                  child: Text(errorMessage!),
                )
              : ListView.builder(
                  itemCount: listOfUsersFiltered!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('images/logo.jpeg'),
                        ),
                        title: Text(listOfUsersFiltered![index].nom_maladie),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailPage(
                                user: listOfUsersFiltered![index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final Maladie user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'utilisateur'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nom_maladie,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
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
