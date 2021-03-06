import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todowy/models/task_data.dart';

import 'package:todowy/widgets/tasks_list.dart';
import 'package:todowy/screens/add_task_screen.dart';
import 'package:todowy/widgets/tasks_list_firestore.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  )));
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.redAccent,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 30.0,
              top: 60.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.black26,
                  foregroundColor: Colors.amberAccent,
                  child: Icon(
                    Icons.menu,
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'TODOWY pro',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasksCount} tasks',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 1.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )),
              child: TasksList(),
            ),
          ),
          // below is the similiar to above TaskList
//          Expanded(
//            child: Container(
//              padding: EdgeInsets.symmetric(horizontal: 20.0),
//              height: 1.0,
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(30.0),
//                    topLeft: Radius.circular(30.0),
//                  )),
//              child: TasksListFireStore(),
//            ),
//          ),
        ],
      ),
    );
  }
}
