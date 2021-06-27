import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/mocks/subjects.dart';
import 'package:mc855/routes.dart';
import 'package:mc855/widgets/bottom_bar.dart';
import 'package:mc855/widgets/list_item.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  int currentIndex = 1;
  List<Subject> items = Mocks.getSubjects();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            items.sort((a, b) => (a.code.compareTo(b.code)));
            final item = items[index];

            return ListItem(item, () => print("config"));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: BottomBarItems.getItems(),
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF80DE5B),
        onTap: (index) => currentIndex != index && currentIndex == 1 ? Routes().replaceToHomePage(context) : Routes().replaceToConfig(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Adicionar nova matéria',
        child: Icon(Icons.add),
      ),
    );
  }
}
