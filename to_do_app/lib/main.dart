import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'To-do App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController textController= TextEditingController();
  List tasks=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       elevation: 0,
       leading: const Icon(Icons.list_alt),
        title: Text(widget.title),
      ),
      body:Column(
        children: [
          const SizedBox(height: 20),
          const Text("To-Do App",style: TextStyle(fontSize: 25),),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration:InputDecoration(
                      hintText: "Enter your job here...",
                      label: const Text("To-do"),
                      labelStyle: const TextStyle(fontSize: 20),
                      helperText: "Enter your job here...",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                IconButton(onPressed:add, icon: const Icon(Icons.add,size: 50,)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
             padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (BuildContext context,int index){
                return Card(
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                 elevation: 10,
                  child: ListTile(
                    title: const Text("Task",style: TextStyle(fontSize: 25),),
                    subtitle: Text(tasks[index],style: const TextStyle(fontSize: 22)),
                              ),
                );
              } 
                ),
          )],
      )
    );
  }
  void add(){
    setState(() {
      tasks.add(textController.text);
      textController.clear();
    });
  }
}