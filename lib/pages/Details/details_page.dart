import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';
import 'package:mc855/utils/days.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Subject subject = ModalRoute.of(context)!.settings.arguments as Subject;

    return Scaffold(
      appBar: AppBar(
        title: Text("${subject.code} - ${subject.name}"),
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
            Text("${subject.code} - ${subject.name} (${subject.credits})"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject.institute),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: subject.classes.length,
                  itemBuilder: (context, classesIndex) {
                    List<Time> lessons = subject.classes[classesIndex].lessons;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(),
                        Text(
                          "Turma ${subject.classes[classesIndex].classCode}",
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
                                    "${Days.getDayOfWeek(subject.classes[classesIndex].lessons[index].dayOfWeek)}, ${subject.classes[classesIndex].lessons[index].initialHour}:00 - ${subject.classes[classesIndex].lessons[index].finalHour}:00"),
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
          ],
        ),
      ),
    );
  }
}
