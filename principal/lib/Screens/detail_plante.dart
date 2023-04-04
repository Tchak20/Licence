import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int heroTag;
  const SecondPage({super.key, required this.heroTag});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Plante")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: widget.heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(_allPlantes[widget.heroTag]['images'],
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  ),
                ),
              ),
            ),
          ),
         Expanded(
          child:  SingleChildScrollView(
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'A propos de ${_allPlantes[widget.heroTag]['name']} ',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Qu\'est ce que ${_allPlantes[widget.heroTag]['name']} :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_main[widget.heroTag]),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Soigne les maladies :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_maladies[widget.heroTag]),
                ],
              ),
            ),
          ],
        ),),
            ),
        ],
      ),
    );
  }

}

final List<String> _maladies = [
  '-Kinkeliba\n -Moringa\n -Moringa\n -Moringa\n -Moringa',
  'Moringa',
  'Souchet',
  'Giroflier',
  'Machin',
  'Autre'
];
final List<String> _main = [
  'Le kinkéliba ou le Combretum micranthum est une plante originaire de l’Afrique de l’Ouest utilisée depuis des siècles en phytothérapie pour ses diverses vertus thérapeutiques notamment diurétiques, cholagogues ou anti-inflammatoires. Connue également sous le nom de tisane de longue vie ou quinquéliba, cette plante qui appartient à la famille des Combrétacées, est également utilisée comme infusion pour le traitement de la constipation ou contre les infections bactériennes.',
  'Le kinkéliba ou le Combretum micranthum est une plante originaire de l’Afrique de l’Ouest utilisée depuis des siècles en phytothérapie pour ses diverses vertus thérapeutiques notamment diurétiques, cholagogues ou anti-inflammatoires. Connue également sous le nom de tisane de longue vie ou quinquéliba, cette plante qui appartient à la famille des Combrétacées, est également utilisée comme infusion pour le traitement de la constipation ou contre les infections bactériennes.',
  'asthme',
  'rhumatisme / arthrite',
  'cholera',
  'hypertension artérielle'
];

 final List<Map<String, dynamic>> _allPlantes = [
    {"id": 1, "name": 'Kinkeliba', "images": 'images/plante1.jpg'},
    {"id": 2, "name":  'Moringa', "images": 'images/plante1.jpg'},
    {"id": 3, "name": 'Souchet', "images": 'images/plante1.jpg'},
    {"id": 4, "name": 'Giroflier', "images": 'images/plante1.jpg'},
    {"id": 5, "name": 'Machin', "images": 'images/plante1.jpg'},
    {"id": 6, "name": 'Autre', "images": 'images/plante1.jpg'},
  ];