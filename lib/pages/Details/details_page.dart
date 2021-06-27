import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Subject subject = ModalRoute.of(context)!.settings.arguments as Subject;

    return Scaffold(
      appBar: AppBar(
        title: Text("${subject.code} - ${subject.name}"),
      ),
      body: Container(),
    );
  }
}
