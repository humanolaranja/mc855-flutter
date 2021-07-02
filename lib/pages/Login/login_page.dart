import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mc855/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String path(str) {
    return (kIsWeb) ? str : 'assets/$str';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF00ADB5),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Image(
                  image: AssetImage(path('logo.png')),
                  width: 120,
                ),
              ),
              Flexible(
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                            obscureText: true,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 72),
                            child: Container(
                              width: double.maxFinite,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () =>
                                    Routes().replaceToHomePage(context),
                                child: Text("Login"),
                              ),
                            ),
                          ),
                          Text("Esqueceu a senha?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Não tem conta? "),
                              TextButton(
                                  onPressed: () =>
                                      Routes().replaceToRegister(context),
                                  child: Text(
                                    "Cadastrar-se",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xDD000000)),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
