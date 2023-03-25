import 'package:flutter/material.dart';
import 'package:flutter_application_1/Newbar.dart';
import 'package:sidebar/sidebar.dart';
import 'package:flutter_application_1/pages/add_event_page.dart';
import 'package:flutter_application_1/pages/event_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: [
            Text('Accueil'),
            Text('Diagnostic'),
            Text('Plantes'),
          ][_currentIndex],
        ),
        body:[
          HomePage(),
          AddEventPages(),
          EventPage(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurrentIndex(index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 30,
          items: const [
          BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil'
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.medical_services),

          label: 'Diagnostic'
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          label: 'Plantes'
          ),
        ]),
      ),
    );
}
}

