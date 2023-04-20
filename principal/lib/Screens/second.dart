import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/resultat.dart';
import 'package:flutter_application_1/Screens/select.dart';

class SecondPage extends StatefulWidget {
  final int numberOfFields;

  SecondPage(this.numberOfFields);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> _fieldValues = [];

  @override
  void initState() {
    super.initState();
    _fieldValues = List.filled(widget.numberOfFields, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptômes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset(
                'images/logo.jpeg',
                width:
                    200, // Changer la valeur pour ajuster la taille de l'image
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 0; i < widget.numberOfFields; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Veuillez entrer une valeur';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _fieldValues[i] = value!;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Symptôme ${i + 1}',
                            prefixIcon: Icon(Icons.numbers),
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 74, 71, 71),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 74, 71, 71)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
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
                                builder: (context) =>
                                    Home(cardTitles: _fieldValues),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text('Diagnostics'),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
