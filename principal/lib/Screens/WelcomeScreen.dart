import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Colors.dart';
import 'package:flutter_application_1/Screens/login_page.dart';
import 'package:flutter_application_1/Screens/signup_page.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Material( 
      child: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
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
              padding: const EdgeInsets.all(20),
              child: Image.asset("images/logo.jpeg"),
            ),
            const SizedBox(height:50),
            const Text("NaturalDoc",
            style: TextStyle(
              color: pColor,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Faite votre diagnostic",
                 style: TextStyle(
                 color: pColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 60),
            Material(
              color: pColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>const SignUpPage2()
                    ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                  child: const Text(
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