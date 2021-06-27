import 'package:mc855/entities/class.dart';

class Subject {
  final String code;
  final String name;
  final String institute;
  final int credits;
  final List<Class> classes;

  Subject(this.code, this.name, this.classes, this.institute, this.credits);
}
