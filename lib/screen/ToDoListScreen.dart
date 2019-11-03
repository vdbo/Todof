import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todof/model/AppState.dart';

class ToDoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);

    return Scaffold(
      appBar: AppBar(title: Text("Todof")),
      body: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
        ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: appState.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(child: Text(appState.todos[index]));
          },
        ),
        RaisedButton(
          child: Text("Add ToDo"),
          onPressed: () {
            appState.addTodo("new todo ${new Random().nextInt(100)}");
          },
        )
      ]),
    );
  }
}
