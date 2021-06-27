import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/mocks/subjects.dart';

class IncludeSubjectPage extends StatefulWidget {
  const IncludeSubjectPage({Key? key}) : super(key: key);

  @override
  _IncludeSubjectPageState createState() => _IncludeSubjectPageState();
}

class _IncludeSubjectPageState extends State<IncludeSubjectPage> {
  List<Subject> items = Mocks.getSubjects();
  List<Subject> itemsToShow = Mocks.getSubjects();

  filter(String search) {
    setState(() {
      List<Subject> newItems = items
          .where(
            (e) => e.code.toLowerCase().contains(search.toLowerCase()) || e.name.toLowerCase().contains(search.toLowerCase()),
          )
          .toList();
      itemsToShow = newItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incluir Matérias"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: (text) => filter(text),
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF80DE5B)),
                ),
                labelText: 'Buscar Matéria',
                labelStyle: TextStyle(color: Color(0xFF80DE5B)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: itemsToShow.length,
              itemBuilder: (context, index) {
                itemsToShow.sort((a, b) => (a.code.compareTo(b.code)));
                final item = itemsToShow[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [Text(item.code), Text(" - "), Text(item.name), Text(" (${item.credits})")],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
