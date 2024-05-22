import 'package:flutter/material.dart';
import 'package:to_do/models/to_do_models.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
    required this.item,
    required this.delete,
    required this.select,
    required this.choose,
  });
  final VoidCallback delete;
  final VoidCallback select;
  final ToDoModels item;
  final bool choose;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          choose
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank_rounded,
        ),
        onPressed: select,
      ),
      title: Text(
        item.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text("Vaqti: ${item.time}"),
      trailing: IconButton(
        onPressed: delete,
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
