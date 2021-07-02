import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/pages/Config/config_page.dart';
import 'package:mc855/pages/Details/details_page.dart';
import 'package:mc855/pages/Home/home_page.dart';
import 'package:mc855/pages/IncludeSubject/include_subject_page.dart';
import 'package:mc855/pages/Login/login_page.dart';
import 'package:mc855/pages/Register/register_page.dart';

class Routes {
  static final String loginPagePath = '/';
  static final String homePagePath = '/home';
  static final String configPagePath = '/config';
  static final String configDetailsPagePath = '/config/details';
  static final String detailsPagePath = '/details';
  static final String includeSubjectPagePath = '/include';
  static final String registerPagePath = '/register';

  getDefault() {
    return {
      loginPagePath: (BuildContext context) => LoginPage(),
      homePagePath: (BuildContext context) =>
          HomePage(title: "Minhas Disciplinas"),
      configPagePath: (BuildContext context) =>
          ConfigPage(title: "Configurar Disciplinas"),
      detailsPagePath: (BuildContext context) => DetailsPage(false),
      configDetailsPagePath: (BuildContext context) => DetailsPage(true),
      includeSubjectPagePath: (BuildContext context) => IncludeSubjectPage(),
      registerPagePath: (BuildContext context) => RegisterPage(),
    };
  }

  routeBuilder(String name, Object arguments) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (BuildContext context, __, ___) =>
          Routes().getDefault()[name](context),
    );
  }

  navigateToHomePage(BuildContext context) {
    Navigator.pushNamed(context, homePagePath);
  }

  navigateToDetailsPage(BuildContext context, Subject subject) {
    Navigator.pushNamed(context, detailsPagePath, arguments: subject);
  }

  navigateToConfigDetailsPage(BuildContext context, Subject subject) {
    Navigator.pushNamed(context, configDetailsPagePath, arguments: subject);
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

  replaceToRegister(BuildContext context) {
    Navigator.pushReplacementNamed(context, registerPagePath);
  }
}
