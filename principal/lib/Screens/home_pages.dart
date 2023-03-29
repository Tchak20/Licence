import 'package:flutter/material.dart';
import 'package:flutter_application_1/Newbar.dart';
import 'package:flutter_application_1/Screens/diagnostic_page.dart';
import 'package:flutter_application_1/Screens/plantes_page.dart';
import 'package:flutter_application_1/Screens/proceder_page.dart';
import 'package:sidebar/sidebar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Text('Diagnostic'),
            Text('Plantes'),
             Text('Procéder médicinaux'),
          ][_currentIndex],
        ),
        body:[
          DiagnosticPage(),
          PlantesScreen(),
          ProcederScreen(),
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
          icon: Icon(Icons.medical_services),

          label: 'Diagnostic'
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.nature),
          label: 'Plantes'
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_outlined),
          label: 'Procédés'
          ),
        ]),
      ),
    );
}
}

