import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedTasks = prefs.getStringList('tasks');
    List<String>? storedStatus = prefs.getStringList('status');

    if (storedTasks != null && storedStatus != null && storedTasks.length == storedStatus.length) {
      setState(() {
        tasks = List.generate(
          storedTasks.length,
          (index) => Task(storedTasks[index], storedStatus[index] == 'true'),
        );
      });
    }
  }

  void saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('tasks', tasks.map((t) => t.text).toList());
    prefs.setStringList('status', tasks.map((t) => t.isDone.toString()).toList());
  }

  void addTask(String task) {
    if (task.isEmpty) return;
    setState(() {
      tasks.add(Task(task, false));
    });
    saveTasks();
    controller.clear();
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  void toggleTaskDone(int index, bool? value) {
    setState(() {
      tasks[index].isDone = value ?? false;
    });
    saveTasks();
  }

  void editTask(int index) {
    controller.text = tasks[index].text;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Task'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Update task'),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              setState(() {
                tasks[index].text = value;
              });
              saveTasks();
              controller.clear();
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.clear();
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  tasks[index].text = controller.text;
                });
                saveTasks();
                controller.clear();
                Navigator.pop(context);
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  final Color darkGreen = Color(0xFF1B5E20);
  final Color mediumGreen = Color(0xFF388E3C);
  final Color lightGreen = Color(0xFFA5D6A7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks (CRUD)'),
        backgroundColor: darkGreen,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [lightGreen.withOpacity(0.4), mediumGreen.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'New Task',
                labelStyle: TextStyle(color: darkGreen),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: darkGreen),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mediumGreen, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add, color: darkGreen),
                  onPressed: () => addTask(controller.text),
                ),
              ),
              onSubmitted: addTask,
            ),
            SizedBox(height: 12),
            Expanded(
              child: tasks.isEmpty
                  ? Center(
                      child: Text(
                        'No tasks yet!',
                        style: TextStyle(color: darkGreen, fontSize: 18),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (_, index) {
                        final task = tasks[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            onTap: () => editTask(index),
                            leading: Checkbox(
                              activeColor: darkGreen,
                              value: task.isDone,
                              onChanged: (value) => toggleTaskDone(index, value),
                            ),
                            title: Text(
                              task.text,
                              style: TextStyle(
                                decoration: task.isDone ? TextDecoration.lineThrough : null,
                                color: task.isDone ? Colors.grey[600] : darkGreen,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () => removeTask(index),
                            ),
                          ),
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

class Task {
  String text;
  bool isDone;
  Task(this.text, this.isDone);
}
