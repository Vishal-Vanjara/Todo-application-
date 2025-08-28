import 'package:flutter/material.dart';
import 'package:to_do_app/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});
   
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List toDoList = [
    ['learn pyhon ', false],
    ['learn Java ', false],
    ['learn css ', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
   void saveNewTask(){
     setState(() {
       toDoList.add([_controller.text, false]);
       _controller.clear();
     });
   }
   void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text('Simple Todo '),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(itemCount :toDoList.length,itemBuilder: (BuildContext context, index){
        return TodoList(
          taskname: toDoList[index][0],
          taskcompleted: toDoList[index][1],
          onchanged: (value) => checkBoxChanged(index),
          deleteFunction: (contex) => deleteTask(index),

        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText:'Add a new to do items' ,
                  filled: true,
                  fillColor: Colors.orange.shade100,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orangeAccent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            ),

            FloatingActionButton(
              onPressed: saveNewTask,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
