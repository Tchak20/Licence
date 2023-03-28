import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login_page.dart';

import 'Screens/WelcomeScreen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
