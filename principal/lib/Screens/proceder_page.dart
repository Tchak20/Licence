import 'package:flutter/material.dart';

class ProcederScreen extends StatelessWidget {
  const ProcederScreen({Key? key}) : super(key: key);

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
      body: 
         Column(
        children: [
          Expanded(
            child: Center(
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(_images[heroTag],height: 250,),
                 
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
                'Potion de Guérison de ${_names[heroTag]} ',
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
                  Text(_ingredient[heroTag]),
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
                  Text(_traitement[heroTag]),
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
  'images/plante2.jpg',
  'images/plante3.jpg',
  'images/plante4.jpg',
  'images/doctor1.jpg',
  'images/doctor2.jpg'
];
final List<String> _names = [
  'fièvre typhoïde',
  'ulcère à l\'estomac',
  'asthme',
  'rhumatisme / arthrite',
  'cholera',
  'hypertension artérielle'
];
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
