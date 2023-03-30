import 'package:flutter/material.dart';

class MyCardMenu extends StatelessWidget {
  const MyCardMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Menu de Cards'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: Text('Plat $index'),
              subtitle: Text('Description du plat $index'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // Action à effectuer lorsqu'un item est cliqué
              },
            ),
          );
        },
      ),
    );
  }
}
