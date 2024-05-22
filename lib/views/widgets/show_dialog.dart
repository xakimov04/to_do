import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:to_do/models/to_do_models.dart';

class AddDialog extends StatefulWidget {
  TodoModel? model;
  AddDialog({this.model, super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  final _formKey = GlobalKey<FormState>();

  String _formattedDate = DateFormat("dd-MMMM").format(DateTime.now());

  String _title = "";
  @override
  void initState() {
    if (widget.model != null) {
      _formattedDate = widget.model!.date;
      _title = widget.model!.title;
    }
    super.initState();
  }

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, {"title": _title, "date": _formattedDate});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey,
      title: widget.model == null
          ? const Text(
              "Add a new  task",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          : const Text(
              "Edit a task",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 108, 140, 156),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 223, 222, 222)),
                label: const Text(
                  "Task name:",
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter task name";
                }
                return null;
              },
              onSaved: (newValue) {
                _title = newValue!;
              },
            ),
            const Gap(20),
            Text(
              textAlign: TextAlign.center,
              "Day: $_formattedDate",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(69, 90, 100, 1),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                DateTime? data = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2024, 5, 22),
                    lastDate: DateTime(2025));

                if (data != null) {
                  _formattedDate = DateFormat("dd-MMMM").format(data);
                }
                setState(() {});
              },
              child: const Text(
                "Select a day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: _add,
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
