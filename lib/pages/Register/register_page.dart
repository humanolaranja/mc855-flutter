import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mc855/routes.dart';

enum character { student, teacher }

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                                borderSide: BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Nome',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                            obscureText: true,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF80DE5B)),
                              ),
                              labelText: 'Repetir Senha',
                              labelStyle: TextStyle(color: Color(0xDD000000)),
                            ),
                            obscureText: true,
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.topLeft,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () => Routes().replaceToLoginPage(context),
                              child: Text(
                                "Voltar",
                                style: TextStyle(color: Color(0xFF80DE5B)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 72),
                            child: Container(
                              width: double.maxFinite,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () => Routes().replaceToLoginPage(context),
                                child: Text("Cadastrar"),
                              ),
                            ),
                          ),
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
