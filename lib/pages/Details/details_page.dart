import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';
import 'package:mc855/utils/days.dart';
import 'package:mc855/widgets/conditional_widget.dart';

class DetailsPage extends StatelessWidget {
  final bool edit;

  const DetailsPage(this.edit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Subject subject = ModalRoute.of(context)!.settings.arguments as Subject;

    return Scaffold(
      appBar: AppBar(
        title: Text("${subject.code} - ${subject.name} (${subject.credits})"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Código: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${subject.code}"),
                          ],
                        ),
                        ConditionalWidget(
                          edit,
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Nome: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${subject.name}"),
                          ],
                        ),
                        ConditionalWidget(
                          edit,
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Instituto: ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "${subject.institute}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ConditionalWidget(
                          edit,
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Créditos: ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("${subject.credits}"),
                          ],
                        ),
                        ConditionalWidget(
                          edit,
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 28, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Turmas",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ConditionalWidget(
                        edit,
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: subject.classes.length,
                  itemBuilder: (context, classesIndex) {
                    List<Time> lessons = subject.classes[classesIndex].lessons;

                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Turma ${subject.classes[classesIndex].classCode}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ConditionalWidget(
                                  edit,
                                  child: Icon(Icons.edit),
                                ),
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: lessons.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${Days.getDayOfWeek(subject.classes[classesIndex].lessons[index].dayOfWeek)}, ${subject.classes[classesIndex].lessons[index].initialHour}:00 - ${subject.classes[classesIndex].lessons[index].finalHour}:00"),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
