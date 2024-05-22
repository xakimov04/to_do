import 'package:flutter/material.dart';
import 'package:to_do/controllers/controller.dart';
import 'package:to_do/views/widgets/list_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Controller();

  void delete(int index) {
    setState(() {});
    controller.remove(index);
  }

  void select(int index) {
    setState(() {
      controller.select(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "To Do app",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Bajarilganlar: ${controller.num()}"),
                Text("Bajarilmaganlar: ${controller.num2()}"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  final item = controller.data[index];
                  return BuildListTile(
                    choose: item.select,
                    item: item,
                    delete: () {
                      delete(index);
                    },
                    select: () {
                      select(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
