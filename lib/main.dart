import 'package:flutter/material.dart';
import 'package:mc855/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Routes routes = Routes();
    return MaterialApp(
      title: 'PEPAD',
      theme: ThemeData(
          primaryColor: Color(0xFF00ADB5),
          buttonColor: Color(0xFF80DE5B),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF80DE5B),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF80DE5B))),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Color(0xFF80DE5B),
          )),
      onGenerateRoute: (settings) {
        if (routes.getDefault().containsKey(settings.name)) {
          return routes.routeBuilder(settings.name!, settings.arguments ?? {});
        }
        return null; // not found page
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
