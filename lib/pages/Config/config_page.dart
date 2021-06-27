import 'package:flutter/material.dart';
import 'package:mc855/routes.dart';
import 'package:mc855/widgets/bottom_bar.dart';

class ConfigPage extends StatefulWidget {
  ConfigPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  List<String> items = ["amendoim", "crocante"];
  int currentIndex = 1;

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
            final item = items[index];

            return Card(
              child: ListTile(
                title: Text(item),
                subtitle: Text(item),
              ),
            );
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
