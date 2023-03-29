import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Colors.dart';
import 'package:flutter_application_1/Screens/login_page.dart';

import 'home_pages.dart';

class WelcomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Material( 
      child: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              wColor.withOpacity(0.8),
              wColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/logo.jpeg"),
            ),
            SizedBox(height:50),
            Text("NaturalDoc",
            style: TextStyle(
              color: pColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
            ),
            SizedBox(height: 10),
            Text(
              "Faite votre diagnostic",
                 style: TextStyle(
                 color: pColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2,
              ),
            ),
            SizedBox(height: 60),
            Material(
              color: pColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>SignInPage2()
                    ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                  child: Text(
                    "Commencer",
                    style: TextStyle(
                      color: wColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
              ),
            ),
           
          ],
          ),
      )
    ));
  }
}