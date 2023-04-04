import 'package:flutter/material.dart';

import 'detail_plante.dart';
import 'detail_proceder.dart';

class ProcederScreen extends StatefulWidget {
  const ProcederScreen({super.key, });

  @override
  State<ProcederScreen> createState() => _ProcederScreenState();
}

class _ProcederScreenState extends State<ProcederScreen> {

 // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allPlantes;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allPlantes;
    } else {
      results = _allPlantes
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Plantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                     itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage2(heroTag: _foundUsers[index]['id']-1)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Hero(
                        tag: index,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            _foundUsers[index]["images"],
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        _foundUsers[index]['name'],
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                    ],
                  ),
                ),
              );
            },
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

 final List<Map<String, dynamic>> _allPlantes = [
    {"id": 1, "name": 'Kinkeliba', "images": 'images/plante1.jpg'},
    {"id": 2, "name":  'Moringa', "images": 'images/plante1.jpg'},
    {"id": 3, "name": 'Souchet', "images": 'images/plante1.jpg'},
    {"id": 4, "name": 'Giroflier', "images": 'images/plante1.jpg'},
    {"id": 5, "name": 'Machin', "images": 'images/plante1.jpg'},
    {"id": 6, "name": 'Autre', "images": 'images/plante1.jpg'},
  ];
