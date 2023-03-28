import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Colors.dart';

import 'home_pages.dart';

class WelcomeScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      child:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              pColor.withOpacity(0.8),
              pColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            )
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("images/doctors.png"),
            ),
            SizedBox(height:50),
            Text("Doctor online",
            style: TextStyle(
              color: wColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
            ),
            SizedBox(height: 10),
            Text(
              "Appolit Your Doctor",
                 style: TextStyle(
                 color: wColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2,
              ),
            ),
            SizedBox(height: 60),
            Material(
              color: wColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>HomePage()
                    ));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                  child: Text(
                    "Let's Go",
                    style: TextStyle(
                      color: pColor,
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
    );
  }
}