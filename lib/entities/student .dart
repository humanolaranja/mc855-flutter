import 'package:mc855/entities/class.dart';

class Student {
  final String name;
  final String email;
  final String password;
  final List<Class> classes = [];

  Student(this.name, this.email, this.password);
}
