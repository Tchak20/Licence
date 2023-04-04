import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/plantes_page.dart';

import 'login_page.dart';

class PlanteCat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.only(top: 50),
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: GestureDetector(
                 onTap: () {
                 Navigator.push(context, MaterialPageRoute(
                      builder: (context) => PlantesScreen(id: '$index')
                      ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://picsum.photos/id/${index + 10}/200/200',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Catégorie ${index + 1}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
            );
          }),
        ),
      ),
    );
  }
}
