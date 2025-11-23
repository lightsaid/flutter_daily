import 'package:flutter/material.dart';
import 'package:flutter_daily/todo/models.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();

  List<Todo> toDoList = [];

  onSave() {
    if (_textController.text == "") {
      return;
    }
    Todo item = Todo(title: _textController.text);
    toDoList.add(item);
    Navigator.of(context).pop();
    setState(() {});
  }

  void createToDo() {
    showDialog(
        context: context,
        builder: (context) {
          _textController.text = '';
          return DialogBox(
            controller: _textController,
            onSave: onSave,
          );
        });
  }

  void checkBoxChange(bool? checked, int index) {
    bool current = checked ?? false;
    setState(() {
      toDoList[index].completed = current;
    });
  }

  void deleteToDo(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    toDoList.add(Todo(title: "Flutter"));
    toDoList.add(Todo(title: "Golang"));
    toDoList.add(Todo(title: "TypeScript", completed: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text("To Do"),
        elevation: 0, // 阴影大小
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createToDo,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTitle(
            title: toDoList[index].title,
            completed: toDoList[index].completed,
            onChanged: (checked) => checkBoxChange(checked, index),
            deleteFn: (context) => deleteToDo(index),
          );
        },
      ),
    );
  }
}

class ToDoTitle extends StatelessWidget {
  final String title;
  final bool completed;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFn;

  const ToDoTitle({
    super.key,
    required this.title,
    required this.completed,
    this.onChanged,
    this.deleteFn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // 使用Padding组件当CSS margin 使用
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      // NOTE: Slidable右滑删除
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFn,
              icon: Icons.delete,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              backgroundColor: Colors.red.shade300,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: completed, onChanged: onChanged),
              Text(
                title,
                style: TextStyle(
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const DialogBox(
      {super.key, required this.controller, this.onSave, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "添加待办事项"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 保存
                MyButton(text: "保存", onPressed: onSave ?? () {}),

                // 取消
                MyButton(
                  text: "取消",
                  onPressed: onCancel ??
                      () {
                        Navigator.of(context).pop();
                      },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}
