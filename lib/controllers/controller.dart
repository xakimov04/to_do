import 'package:to_do/models/to_do_models.dart';

class TodoController {
  final _todoList = [
    TodoModel(title: "Yugurish", date: "07:00", checkDone: false),
    TodoModel(title: "Ovqatlanish", date: "07:30", checkDone: false),
    TodoModel(title: "Dars qilish", date: "09:00", checkDone: false),
  ];

  List<TodoModel> get todoList {
    return [..._todoList];
  }

  void deletePlan(int index) {
    _todoList.removeAt(index);
  }

  void add(String name, String date) {
    _todoList.add(
      TodoModel(title: name, date: date, checkDone: false),
    );
  }

  int counter() {
    int counter = 0;
    for (var i in _todoList) {
      if (i.checkDone != true) {
        counter++;
      }
    }
    return counter;
  }
}
