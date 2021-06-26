import 'package:flutter/material.dart';
import 'package:mc855/routes.dart';
import 'package:mc855/widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["amendoim", "crocante"];
  int currentIndex = 0;

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
        onTap: (index) => currentIndex != index && currentIndex == 0 ? Routes().replaceToConfig(context) : Routes().replaceToHomePage(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
