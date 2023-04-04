import 'package:flutter/material.dart';

class SecondPage2 extends StatefulWidget {
  final int heroTag;
  const SecondPage2({super.key, required this.heroTag});

  @override
  State<SecondPage2> createState() => _SecondPage2State();
}

class _SecondPage2State extends State<SecondPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Procédés médicinaux")),
      body: 
         Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: widget.heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(_allDiseases[widget.heroTag]['images'],height: 250,),
                 
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
                'Potion de Guérison de ${_allDiseases[widget.heroTag]['name']} ',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ingrédients :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_ingredient[widget.heroTag]),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Instructions :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_traitement[widget.heroTag]),
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

final List<String> _traitement = [
  '- Couper les racines de mandragore en  petits morceaux. \n - Mettre les morceaux de racines de mandragore, les fleurs de lavande, les feuilles de menthe, le miel et le sucre de canne dans une grande casserole. \n - Ajouter 4 tasses d\'eau à la casserole. \n - Porter à ébullition, puis réduire le feu et laisser mijoter pendant 30 minutes. \n - Retirer du feu et laisser refroidir. \n - Filtrer le liquide à travers un tamis fin et transférer la potion dans des bouteilles en verre. \n - Conserver au réfrigérateur jusqu\'à ce que la potion soit prête à être utilisée.',
  '- Aouper les racines de mandragore en  petits morceaux. \n - Mettre les morceaux de racines de mandragore, les fleurs de lavande, les feuilles de menthe, le miel et le sucre de canne dans une grande casserole. \n - Ajouter 4 tasses d\'eau à la casserole. \n - Porter à ébullition, puis réduire le feu et laisser mijoter pendant 30 minutes. \n - Retirer du feu et laisser refroidir. \n - Filtrer le liquide à travers un tamis fin et transférer la potion dans des bouteilles en verre. \n - Conserver au réfrigérateur jusqu\'à ce que la potion soit prête à être utilisée.',
  'Obtenez des graines de mangue, coupez-les en morceaux et laissez-les sécher au soleil. Broyer en poudre. Mettez une cuillère de poudre dans une tasse d\'eau en verre, remuez et buvez. Une fois par jour pendant 3-4 semaines.',
  'Obtenez 5 graines de poire anglaise (poire d\'avocat), coupées en morceaux et séchées au soleil, broyées en poudre. Mélanger avec un verre de miel pour former une pâte. Prendre une cuillère, 3 fois par jour jusqu\'aux 6 jours.',
  'Prenez trois cuillères à café de sel et une cuillère à café de sucre, ajoutez une demi-cuillère de gin sec. Buvez le tout en une seule dose. Le choléra s\'arrêtera immédiatement.',
  'Obtenez 4 graines de poire d\'avocat, coupées en morceaux, séchées au soleil et broyées en poudre. Mettez une cuillère à café de cette poudre dans votre palpe préparée et buvez. Une fois par jour pendant 2 semaines.'
];
final List<String> _ingredient = [
  '- 2 tasses de racines de mandragore \n - 1 poignée de fleurs de lavande \n - 1/2 tasse de feuilles de menthe \n - 3 cuillères à soupe de miel \n - 1/4 tasse de sucre de canne \n - 4 tasses d\'eau',
  '- 2 tasses de racines de mandragore \n - 1 poignée de fleurs de lavande \n - 1/2 tasse de feuilles de menthe \n - 3 cuillères à soupe de miel \n - 1/4 tasse de sucre de canne \n - 4 tasses d\'eau',
  'asthme',
  'rhumatisme / arthrite',
  'cholera',
  'hypertension artérielle'
];

 final List<Map<String, dynamic>> _allDiseases = [
    {"id": 1, "name": 'Kinkeliba', "images": 'images/plante1.jpg'},
    {"id": 2, "name":  'Moringa', "images": 'images/plante1.jpg'},
    {"id": 3, "name": 'Souchet', "images": 'images/plante1.jpg'},
    {"id": 4, "name": 'Giroflier', "images": 'images/plante1.jpg'},
    {"id": 5, "name": 'Machin', "images": 'images/plante1.jpg'},
    {"id": 6, "name": 'Autre', "images": 'images/plante1.jpg'},
  ];