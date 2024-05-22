import 'package:flutter/material.dart';
import 'package:to_do/models/to_do_models.dart';
import 'package:to_do/views/widgets/dellete_dialog.dart';
import 'package:to_do/views/widgets/show_dialog.dart';

class PlanWidget extends StatelessWidget {
  TodoModel model;
  VoidCallback onDone;
  VoidCallback onDeleted;
  VoidCallback onEdited;

  PlanWidget(
      {required this.model,
      required this.onEdited,
      required this.onDone,
      required this.onDeleted,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onDone,
          child: model.checkDone
              ? const Icon(
                  Icons.check_box_outlined,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.check_box_outline_blank_rounded,
                  color: Colors.grey,
                ),
        ),
        title: Text(
          model.title,
          style: TextStyle(
            decoration: model.checkDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.black,
            decorationThickness: 2,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: model.checkDone ? Colors.grey.shade600 : null,
          ),
        ),
        subtitle: Text(
          model.date,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () async {
                  Map<String, dynamic>? data = await showDialog(
                    context: context,
                    builder: (context) {
                      return AddDialog(model: model);
                    },
                  );
                  model.title = data!["title"];
                  model.date = data["date"];
                  onEdited();
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blueGrey,
                )),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(
                      onDeleted: onDeleted,
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
