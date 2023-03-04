import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController tasksController = TextEditingController();
  List taskTitles = [];
  List tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.list_alt),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "To-Do App",
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        label: const Text("Task Title"),
                        labelStyle: const TextStyle(fontSize: 20),
                        helperText: "Enter your task title ",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: tasksController,
                      decoration: InputDecoration(
                        label: const Text("Task Detail"),
                        labelStyle: const TextStyle(fontSize: 20),
                        helperText: "Enter your task detail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              child: IconButton(
                  onPressed: add,
                  icon: const Icon(
                    Icons.check,
                    size: 50,
                    color: Colors.green,
                  )),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          taskTitles[index],
                          style: const TextStyle(fontSize: 25),
                        ),
                        subtitle: Text(tasks[index],
                            style: const TextStyle(fontSize: 22)),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }

  void add() {
    setState(() {
      taskTitles.add(titleController.text);
      titleController.clear();

      tasks.add(tasksController.text);
      tasksController.clear();
    });
  }
}
