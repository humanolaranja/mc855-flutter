import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/pages/Config/config_page.dart';
import 'package:mc855/pages/Details/details_page.dart';
import 'package:mc855/pages/Home/home_page.dart';
import 'package:mc855/pages/IncludeSubject/include_subject_page.dart';
import 'package:mc855/pages/Login/login_page.dart';

class Routes {
  static final String loginPagePath = '/';
  static final String homePagePath = '/home';
  static final String configPagePath = '/config';
  static final String detailsPagePath = '/details';
  static final String includeSubjectPagePath = '/include';

  getDefault() {
    return {
      loginPagePath: (BuildContext context) => LoginPage(),
      homePagePath: (BuildContext context) => HomePage(title: "Minhas Disciplinas"),
      configPagePath: (BuildContext context) => ConfigPage(title: "Configurar Disciplinas"),
      detailsPagePath: (BuildContext context) => DetailsPage(),
      includeSubjectPagePath: (BuildContext context) => IncludeSubjectPage(),
    };
  }

  routeBuilder(String name, Object arguments) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (BuildContext context, __, ___) => Routes().getDefault()[name](context),
    );
  }

  navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, homePagePath);
  }

  navigateToDetailsPage(BuildContext context, Subject subject) {
    Navigator.pushNamed(context, detailsPagePath, arguments: subject);
  }

  navigateToincludeSubjectPage(BuildContext context) {
    Navigator.pushNamed(context, includeSubjectPagePath);
  }

  replaceToLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, loginPagePath);
  }

  replaceToHomePage(BuildContext context) {
    Navigator.pushReplacementNamed(context, homePagePath);
  }

  replaceToConfig(BuildContext context) {
    Navigator.pushReplacementNamed(context, configPagePath);
  }
}
