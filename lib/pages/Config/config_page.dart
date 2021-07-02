import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/mocks/subjects.dart';
import 'package:mc855/pages/Details/details_page.dart';
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
  List<String> institutes = Mocks.getInstitutes();
  String institute = "";
  String code = "";
  String name = "";
  int credits = 0;

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
    print(institute);

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

            return ListItem(item, () => Routes().navigateToConfigDetailsPage(context, PageArguments(item, removeSubject)));
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
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("Instituto/Faculdade"),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: institute,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        institute = newValue!;
                                      });
                                    },
                                    items: institutes.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Código"),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: TextField(
                                    onChanged: (text) => {
                                      setState(() {
                                        code = text;
                                      })
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF80DE5B)),
                                      ),
                                      labelStyle: TextStyle(color: Color(0xFF80DE5B)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Nome"),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: TextField(
                                    onChanged: (text) => {
                                      setState(() {
                                        name = text;
                                      })
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF80DE5B)),
                                      ),
                                      labelStyle: TextStyle(color: Color(0xFF80DE5B)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Créditos"),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) => {
                                      setState(() {
                                        credits = int.parse(text);
                                      })
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xFF80DE5B)),
                                      ),
                                      labelStyle: TextStyle(color: Color(0xFF80DE5B)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: () => {
                            addNewSubject(Subject(code, name, [], institute, credits)),
                            setState(() {
                              code = "";
                              name = "";
                              institute = "";
                              credits = 0;
                            }),
                            Navigator.pop(context),
                          },
                          child: Text("Criar"),
                        ),
                      ),
                    ],
                  ),
                );
              });
            }),
        tooltip: 'Adicionar nova matéria',
        child: Icon(Icons.add),
      ),
    );
  }
}
