import 'package:to_do/models/to_do_models.dart';

class Controller {
  List<ToDoModels> data = [
    ToDoModels(title: "uy ishini qilish", time: "09 : 30", select: false),
    ToDoModels(title: "uy ishini qilish", time: "09 : 30", select: false),
    ToDoModels(title: "uy ishini qilish", time: "09 : 30", select: false),
  ];

  int num() {
    int count = 0;
    for (var i in data) {
      if (i.select) {
        count++;
      }
    }
    return count;
  }
  int num2() {
    int count1 = 0;
    for (var i in data) {
      if (!i.select) {
        count1++;
      }
    }
    return count1;
  }

  void select(index) {
    data[index].select = !data[index].select;
  }

  void remove(index) {
    data.removeAt(index);
  }
}
