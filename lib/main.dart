import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/models/todo.model.dart';
import 'package:fluttermobx/stores/todo.store.dart';
import 'package:mobx/mobx.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

final todoStore = TodoStore();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (BuildContext context) =>
              Text(todoStore.todos.length.toString()),
        ),
      ),
      body: Container(
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: todoStore.todos.length,
            itemBuilder: (context, index) => Text(todoStore.todos[index].title),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoStore.add(
            Todo(
              id: 1,
              title: 'Testando',
              done: false,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
