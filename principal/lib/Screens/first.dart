import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/second.dart';

/// Page d'entrée pour déterminer le nombre de symptômes à saisir
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  int _numberOfFields = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nombre de Symptômes'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Center(
            child: Image.asset(
              'images/logo.jpeg',
              width: 200, // Ajuster la taille de l'image ici
            ),
          ),
          SizedBox(height: 50),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Svp entrez un nombre';
                      }
                      int? n = int.tryParse(value);
                      if (n == null) {
                        return 'entrez un nombre valide';
                      }
                      if (n < 2 || n > 4) {
                        return 'Entrer un nombre entre 2 and 4';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _numberOfFields = int.parse(value!);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Entrer un nombre',
                      labelText: 'Nombre de Symptomes (2 à 4)',
                      prefixIcon: Icon(Icons.numbers),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 74, 71, 71),
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 74, 71, 71),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(_numberOfFields),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Envoyer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 50),
                        primary: Color.fromARGB(255, 74, 71, 71),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
