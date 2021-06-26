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
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF00ADB5),
        buttonColor: Color(0xFF80DE5B),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF80DE5B),
        ),
      ),
      initialRoute: Routes.homePagePath,
      onGenerateRoute: (settings) {
        if (routes.getDefault().containsKey(settings.name)) {
          return routes.routeBuilder(settings.name!);
        }
        return null; // not found page
      },
    );
  }
}
