import 'package:mc855/entities/class.dart';

class Teacher {
  final String name;
  final String email;
  final String password;
  final List<Class> classes = [];

  Teacher(this.name, this.email, this.password);
}
