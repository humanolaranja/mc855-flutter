import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';
import 'package:mc855/mocks/subjects.dart';
import 'package:mc855/routes.dart';
import 'package:mc855/utils/days.dart';
import 'package:mc855/widgets/bottom_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
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

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    title: Text("${item.code} - ${item.name} (${item.credits})"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.institute),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: item.classes.length,
                          itemBuilder: (context, classesIndex) {
                            List<Time> lessons = item.classes[classesIndex].lessons;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                Text(
                                  "Turma ${item.classes[classesIndex].classCode}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: lessons.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${Days.getDayOfWeek(item.classes[classesIndex].lessons[index].dayOfWeek)}, ${item.classes[classesIndex].lessons[index].initialHour}:00 - ${item.classes[classesIndex].lessons[index].finalHour}:00"),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
        onPressed: () => {},
        tooltip: 'Incluir matéria',
        child: Icon(Icons.add),
      ),
    );
  }
}
