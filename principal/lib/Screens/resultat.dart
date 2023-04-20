import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  final List<String> cardTitles;

  MyApp({Key? key, required this.cardTitles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(cardTitles.length > 0, 'La liste est vide.');
    return MaterialApp(
      title: 'Resultats',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Résultats'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                cardTitles.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardDetails(
                          title: cardTitles[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Image.network(
                          'https://via.placeholder.com/150',
                        ),
                        Text(cardTitles[index]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardDetails extends StatelessWidget {
  final String title;

  CardDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            SizedBox(height: 20),
            Text(
              'Solution',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
                'Pellentesque eget magna rhoncus, semper metus in, posuere tellus.'),
            SizedBox(height: 20),
            Text(
              'Mise en garde',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Morbi accumsan volutpat purus non bibendum.')
          ],
        ),
      ),
    );
  }
}
