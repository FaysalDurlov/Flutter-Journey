import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// MODEL
class Task {
  String name;
  String task;

  Task({required this.name, required this.task});

  Map<String, dynamic> toJson() => {
        'name': name,
        'task': task,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      task: json['task'],
    );
  }
}

// HOME PAGE
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  // LOAD SAVED TASKS
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('tasks');

    if (data != null) {
      List decoded = jsonDecode(data);
      setState(() {
        tasks = decoded.map((e) => Task.fromJson(e)).toList();
      });
    }
  }

  // SAVE TASKS
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    List encoded = tasks.map((e) => e.toJson()).toList();
    prefs.setString('tasks', jsonEncode(encoded));
  }

  // NAVIGATE TO FORM
  void goToForm() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTaskPage()),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
      saveTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task List")),
      body: tasks.isEmpty
          ? const Center(child: Text("No tasks yet"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index].task),
                  subtitle: Text("By: ${tasks[index].name}"),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToForm,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// FORM PAGE
class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final nameController = TextEditingController();
  final taskController = TextEditingController();

  void saveTask() {
    if (nameController.text.isEmpty || taskController.text.isEmpty) return;

    final task = Task(
      name: nameController.text,
      task: taskController.text,
    );

    Navigator.pop(context, task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Your Name"),
            ),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(labelText: "Task"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveTask,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}