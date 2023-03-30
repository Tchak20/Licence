import 'package:flutter/material.dart';

class PotionRecipePage extends StatefulWidget {
  @override
  _PotionRecipePageState createState() => _PotionRecipePageState();
}

class _PotionRecipePageState extends State<PotionRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recette de Potion Médicinale'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Potion de Guérison',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Text('- 2 tasses de racines de mandragore'),
                  Text('- 1 poignée de fleurs de lavande'),
                  Text('- 1/2 tasse de feuilles de menthe'),
                  Text('- 3 cuillères à soupe de miel'),
                  Text('- 1/4 tasse de sucre de canne'),
                  Text('- 4 tasses d\'eau'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Text('1. Couper les racines de mandragore en petits morceaux.'),
                  Text('2. Mettre les morceaux de racines de mandragore, les fleurs de lavande, les feuilles de menthe, le miel et le sucre de canne dans une grande casserole.'),
                  Text('3. Ajouter 4 tasses d\'eau à la casserole.'),
                  Text('4. Porter à ébullition, puis réduire le feu et laisser mijoter pendant 30 minutes.'),
                  Text('5. Retirer du feu et laisser refroidir.'),
                  Text('6. Filtrer le liquide à travers un tamis fin et transférer la potion dans des bouteilles en verre.'),
                  Text('7. Conserver au réfrigérateur jusqu\'à ce que la potion soit prête à être utilisée.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
