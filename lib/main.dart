import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:todof/model/AppState.dart';
import 'package:todof/screen/ToDoListScreen.dart';

void main() => runApp(ScopedModel<AppState>(
    model: AppState(),
    child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ToDoListScreen(),
    )));
