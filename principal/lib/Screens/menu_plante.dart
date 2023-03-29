import 'package:flutter/material.dart';

class MyCardMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Menu de Cards'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('Plat $index'),
              subtitle: Text('Description du plat $index'),
              trailing: Icon(Icons.arrow_forward),
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
