import 'package:flutter/material.dart';

class PlantesScreen extends StatelessWidget {
  const PlantesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SearchBar()),
       body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView.builder(
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondPage(heroTag: index)));
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
                            _images[index],
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Text(
                        _names[index],
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!_isActive)
          Text("",
              style: Theme.of(context).appBarTheme.titleTextStyle),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              child: _isActive
                  ? Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Rechercher quelque chose',
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isActive = false;
                                  });
                                },
                                icon: const Icon(Icons.close))),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          _isActive = true;
                        });
                      },
                      icon: const Icon(Icons.search)),
            ),
          ),
        ),
      ],
    );
  }
}
class SecondPage extends StatelessWidget {
  final int heroTag;

  const SecondPage({Key? key, required this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Procédés médicinaux")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(_images[heroTag],
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
                'A propos de ${_names[heroTag]} ',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Qu\'est ce que ${_names[heroTag]} :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_main[heroTag]),
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
                  Text(_maladies[heroTag]),
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

final List<String> _images = [
  'images/plante1.jpg',
  'images/plante1.jpg',
  'images/plante1.jpg',
  'images/plante1.jpg',
  'images/plante1.jpg',
  'images/plante1.jpg',
];
final List<String> _names = [
  'Kinkeliba',
  'Moringa',
  'Souchet',
  'Giroflier',
  'Machin',
  'Autre'
];
final List<String> _maladies = [
  '-Kinkeliba \n -Moringa\n -Moringa\n -Moringa\n -Moringa',
  'Moringa',
  'Souchet',
  'Giroflier',
  'Machin',
  'Autre'
];
final List<String> _main = [
  'Le kinkéliba ou le Combretum micranthum est une plante originaire de l’Afrique de l’Ouest utilisée depuis des siècles en phytothérapie pour ses diverses vertus thérapeutiques notamment diurétiques, cholagogues ou anti-inflammatoires. Connue également sous le nom de tisane de longue vie ou quinquéliba, cette plante qui appartient à la famille des Combrétacées, est également utilisée comme infusion pour le traitement de la constipation ou contre les infections bactériennes.',
  '- 2 tasses de racines de mandragore \n - 1 poignée de fleurs de lavande \n - 1/2 tasse de feuilles de menthe \n - 3 cuillères à soupe de miel \n - 1/4 tasse de sucre de canne \n - 4 tasses d\'eau',
  'asthme',
  'rhumatisme / arthrite',
  'cholera',
  'hypertension artérielle'
];
