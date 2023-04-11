import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/Screens/home_pages.dart';
import 'package:flutter_application_1/Screens/signup_page.dart';

class SignInPage2 extends StatelessWidget {
  const SignInPage2({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "CONNEXION",
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
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void login(http.MultipartRequest formData) async {
    if (_formKey.currentState?.validate() ?? false) {
      // Envoyer les données au serveur
      var response = await formData.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        Map<String, dynamic> data = jsonDecode(responseBody);
        if (data['success'] == false) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert !'),
                content: Text(' ${data['message']}'),
                actions: [
                  TextButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage2()))),
                ],
              );
            },
          );
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        }
        // Naviguer vers une autre page
      } else {
        // Afficher un message d'erreur
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Une erreur s\'est produite lors de l\'envoi des données.')));
      }
    }
  }

  var log = new http.MultipartRequest('POST',
      Uri.parse('https://enuretic-contracts.000webhostapp.com/crud/login.php'));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir le mail';
                }

                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Veuillez entrer un mail valide';
                } else {
                  log.fields['email'] = value;
                }

                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Entrer votre email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return 'Veuillez saisir un  mot de passe (8 caractères Min)';
                }
                bool regExp = RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                    .hasMatch(value);
                if (!regExp) {
                  return 'Incorrect :  8 caractères Min (ex : Mario06ag@)';
                } else {
                  log.fields.addAll({'password': value});
                }
                return null;
              },
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                  labelText: 'Mot de passe ',
                  hintText: 'Entrer votre mot de passe ',
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )),
            ),
            _gap(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPage2()));
              },
              child: Text(
                "S'inscrire",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Connexion',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    login(log);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _gap() => const SizedBox(height: 16);
}
