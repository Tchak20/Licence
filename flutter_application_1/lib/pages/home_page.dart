import 'package:flutter/material.dart';

import 'event_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Image.asset("assets/images/img.jpeg"),
              const Text("Nom app ! ", 
                style: TextStyle(
                  fontSize: 42,
                ),
               ) ,
              const Text("Slogan de l'app ",
              style: TextStyle(
                fontSize: 24
              ),
              textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20)),
            
            ],
          )
        );
  }
}