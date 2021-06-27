import 'package:flutter/material.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';
import 'package:mc855/utils/days.dart';

class ListItem extends StatelessWidget {
  final Subject item;
  final Function onTap;

  const ListItem(this.item, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () => onTap(),
        child: MouseRegion(
          child: Card(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListTile(
                  title: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text("${item.code} - ${item.name} (${item.credits})"),
                  ),
                  subtitle: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Column(
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
            ),
          ),
        ),
      ),
    );
  }
}
