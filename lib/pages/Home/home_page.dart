import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/mocks/subjects.dart';
import 'package:mc855/pages/Details/details_page.dart';
import 'package:mc855/routes.dart';
import 'package:mc855/widgets/bottom_bar.dart';
import 'package:mc855/widgets/list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Subject> items = Mocks.getMySubjects();

  addNewSubject(Subject subject) {
    setState(() {
      List<Subject> newItems = items;
      newItems.add(subject);
      newItems.sort((a, b) => (a.code.compareTo(b.code)));
      items = newItems;
    });
  }

  removeSubject(Subject subject) {
    setState(() {
      List<Subject> newItems = items;
      newItems.remove(subject);
      newItems.sort((a, b) => (a.code.compareTo(b.code)));
      items = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.all(20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Routes().replaceToLoginPage(context),
                child: Text("Sair"),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            items.sort((a, b) => (a.code.compareTo(b.code)));
            final item = items[index];

            return ListItem(
              item,
              () => Routes().navigateToDetailsPage(context, PageArguments(item, removeSubject)),
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
        onPressed: () => Routes().navigateToincludeSubjectPage(context, addNewSubject),
        tooltip: 'Incluir mat??ria',
        child: Icon(Icons.add),
      ),
    );
  }
}
