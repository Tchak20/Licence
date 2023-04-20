import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Screens/home_pages.dart';
import 'package:flutter_application_1/Screens/customTextField.dart';
import 'package:flutter_application_1/Services/apiServices.dart';

import 'Colors.dart';
import 'login_page.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: isSmallScreen
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          _Logo(),
                          _FormContent(),
                        ],
                      )
                    : Container(
                        padding: const EdgeInsets.all(32.0),
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Row(
                          children: const [
                            Expanded(child: _Logo()),
                            Expanded(
                              child: Center(child: _FormContent()),
                            ),
                          ],
                        ),
                      ))));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(0),
          child: Text(
            '',
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        ))
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isPasswordVisible = false;
  String _selectedValue = 'Option 1';
  String? pass = '';
  bool _rememberMe = false;
  bool? isChecked = false; // état initial de la case à cocher
  _register() async {
    var data = {
      'nom': nameController.text,
      'email': emailController.text,
      'password': passController.text,
    };
    debugPrint(nameController.text);
    debugPrint(emailController.text);
    debugPrint(passController.text);
    debugPrint(repassController.text);
    _showMsg(msg) {
      //
      final snackBar = SnackBar(
        backgroundColor: const Color.fromRGBO(184, 134, 11, 1),
        content: Text(msg),
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.white,
          onPressed: () {
            /*créer une page flutter avec un formulaire qui demande un nombre entre 2 et 4 et qui affich
            e apres validattion une autre page contenant un formulaire de chmps n avec n égale a la valeurs saisis*/
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    var res = await apiServices().postData(data, 'register');
    var body = json.decode(res.body);
    print(body);
    if (body['success']) {
      Map<String, dynamic> data = json.decode(res.body);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SignInPage2()));
    } else {
      if (!body['message']) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Alert !'),
              content: Text(
                  '* Nom: Obligatoire (3 - 20 caractères)\n * Email: Obligatoire & unique (ex: edoctor@gmail.com)\n* Mot de passe: Obligatoire & 8 caractères min'),
              actions: [
                TextButton(
                    child: Text('OK'),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage2()))),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget _buildRadio(String value) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: _selectedValue,
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
        padding: const EdgeInsets.all(50),
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.07),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * 0.05),
                const Text(
                  "Inscription",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: pColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.05),
                TextInput(
                    prefixIcon: Icon(Icons.person),
                    textString: "Nom",
                    textController: nameController,
                    obscureText: false),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                    prefixIcon: Icon(Icons.email),
                    textString: "Email",
                    textController: emailController,
                    obscureText: false),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  textString: "Password",
                  textController: passController,
                  obscureText: true,
                ),
                SizedBox(
                  height: height * .05,
                ),
                TextInput(
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  textString: "Password",
                  textController: repassController,
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          var route = MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignInPage2());
                          Navigator.of(context).push(route);
                        },
                        child: const Text(
                          'Connexion',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(pColor),
                        ),
                        onPressed: () {
                          _register();
                        },
                        child: const Text('Register'),
                      ),
                    ),
                  ],
                )
              ]),
        ));
  }
}

class TextInput extends StatelessWidget {
  final String textString;
  TextEditingController textController;
  final bool obscureText;
  final Icon prefixIcon;
  TextInput(
      {Key? key,
      required this.textString,
      required this.textController,
      required this.obscureText,
      required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color(0xFF000000)),
      cursorColor: const Color(0xFF9b9b9b),
      controller: textController,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
          hintText: textString,
          hintStyle: const TextStyle(
              color: Color(0xFF9b9b9b),
              fontSize: 15,
              fontWeight: FontWeight.normal),
          labelStyle: const TextStyle(color: Color.fromARGB(255, 74, 71, 71)),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder()),
    );
  }
}
