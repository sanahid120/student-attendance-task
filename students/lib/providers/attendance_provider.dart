import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = [];

  List<Student> get students => _students;

  int get totalStudents => _students.length;
  int get presentCount => _students.where((s) => s.isPresent).length;
  int get absentCount => _students.where((s) => !s.isPresent).length;

  void addStudent(String name) {
    if (name.trim().isNotEmpty) {
      _students.add(Student(
        id: DateTime.now().toString(),
        name: name.trim(),
      ));
      notifyListeners();
    }
  }

  void removeStudent(String id) {
    _students.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  void toggleAttendance(String id) {
    final index = _students.indexWhere((s) => s.id == id);
    if (index != -1) {
      _students[index].isPresent = !_students[index].isPresent;
      notifyListeners();
    }
  }
}
