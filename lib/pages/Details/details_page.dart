import 'package:flutter/material.dart';
import 'package:mc855/entities/class.dart';
import 'package:mc855/entities/subject.dart';
import 'package:mc855/entities/time.dart';
import 'package:mc855/utils/days.dart';
import 'package:mc855/widgets/conditional_widget.dart';

class PageArguments {
  final Subject subject;
  final Function remove;

  PageArguments(this.subject, this.remove);
}

class DetailsPage extends StatefulWidget {
  final bool edit;

  const DetailsPage(this.edit, {Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Subject subject = Subject("Loading", "", [], "", 0);
  String classCode = "";
  List<Time> times = [];
  int firstInitialTime = -1;
  int firstFinalTime = -1;
  int secondInitialTime = -1;
  int secondFinalTime = -1;
  int firstWeekDay = 1;
  int secondWeekDay = 1;

  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration.zero, () {
      final arguments = ModalRoute.of(context)!.settings.arguments as PageArguments;
      setState(() {
        subject = arguments.subject;
      });
    });
  }

  create() {
    List<Time> times = [];
    Time firstTime = Time(firstWeekDay, firstInitialTime, firstFinalTime);
    Time secondTime = Time(secondWeekDay, secondInitialTime, secondFinalTime);

    times.add(firstTime);

    if (secondTime.initialHour != -1 || secondTime.finalHour != -1) {
      times.add(secondTime);
    }

    List<Class> myClasses = subject.classes;
    myClasses.add(Class(classCode, times));

    setState(() {
      subject = Subject(subject.code, subject.name, myClasses, subject.institute, subject.credits);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as PageArguments;
    final Function removeSubject = arguments.remove;

    if (subject.code == "Loading") {
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${subject.code} - ${subject.name} (${subject.credits})"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => {removeSubject(subject), Navigator.pop(context)},
                child: Icon(Icons.delete),
              ),
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
                          widget.edit,
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
                          widget.edit,
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
                          widget.edit,
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
                          widget.edit,
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
                        widget.edit,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                              onTap: () => showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                          return Container(
                                            height: MediaQuery.of(context).size.height / 1.5,
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("Código da Turma"),
                                                        Expanded(
                                                          child: Padding(
                                                            padding: EdgeInsets.all(16),
                                                            child: TextField(
                                                              onChanged: (text) => {
                                                                setState(() {
                                                                  classCode = text;
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
                                                    Card(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text("Dia da Semana"),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                                                    child: DropdownButton<String>(
                                                                      isExpanded: true,
                                                                      value: Days.getDayOfWeek(firstWeekDay),
                                                                      onChanged: (String? newValue) {
                                                                        setState(() {
                                                                          firstWeekDay = Days.getDaysOfWeek().indexOf(newValue!);
                                                                        });
                                                                      },
                                                                      items: Days.getDaysOfWeek().map<DropdownMenuItem<String>>((String value) {
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
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Text("Hora Inicial"),
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(16),
                                                                          child: TextField(
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (text) => {
                                                                              setState(() {
                                                                                firstInitialTime = int.parse(text);
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
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Text("Hora Final"),
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(16),
                                                                          child: TextField(
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (text) => {
                                                                              setState(() {
                                                                                firstFinalTime = int.parse(text);
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
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Card(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(8),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text("Dia da Semana"),
                                                                Expanded(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                                                    child: DropdownButton<String>(
                                                                      isExpanded: true,
                                                                      value: Days.getDayOfWeek(secondWeekDay),
                                                                      onChanged: (String? newValue) {
                                                                        setState(() {
                                                                          secondWeekDay = Days.getDaysOfWeek().indexOf(newValue!);
                                                                        });
                                                                      },
                                                                      items: Days.getDaysOfWeek().map<DropdownMenuItem<String>>((String value) {
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
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Text("Hora Inicial"),
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(16),
                                                                          child: TextField(
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (text) => {
                                                                              setState(() {
                                                                                secondInitialTime = int.parse(text);
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
                                                                ),
                                                                Expanded(
                                                                  child: Row(
                                                                    children: [
                                                                      Text("Hora Final"),
                                                                      Expanded(
                                                                        child: Padding(
                                                                          padding: EdgeInsets.all(16),
                                                                          child: TextField(
                                                                            keyboardType: TextInputType.number,
                                                                            onChanged: (text) => {
                                                                              setState(() {
                                                                                secondFinalTime = int.parse(text);
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
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  width: double.maxFinite,
                                                  child: ElevatedButton(
                                                    onPressed: () => {
                                                      create(),
                                                    },
                                                    child: Text("Criar"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                              child: Icon(Icons.add)),
                        ),
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
                                  widget.edit,
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
