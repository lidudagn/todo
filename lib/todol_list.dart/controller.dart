import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/todol_list.dart/detail.dart';

import '../model/todo_model.dart';
import '../todol_list.dart/editTodo.dart';

class Todo_controller extends GetxController {
  // CollectionReference todo = FirebaseFirestore.instance.collection('todos');
  late TextEditingController title, description;
  //
  //
  //
  // edit this object
  TodoModel? editTodo;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<TodoModel> todos = RxList<TodoModel>([]);

  bool Checkbox = false;

  @override
  void onInit() {
    super.onInit();
    collectionReference = firebaseFirestore.collection("todo");
    todos.bindStream(allTodos());

    title = TextEditingController();
    description = TextEditingController();
  }

  Stream<List<TodoModel>> allTodos() => collectionReference.snapshots().map(
        (query) => query.docs.map((item) => TodoModel.fromMap(item)).toList(),
      );
  onetodo(String id) async {
    if (editTodo != null) {
      editTodo!.title = '';
      editTodo!.description = '';
    }

    update();
    var todos;
    var oneTodo = FirebaseFirestore.instance
        .collection('todo')
        .doc(id)
        .get()
        .then((DocumentSnapshot querySnapshot) {
      var x = querySnapshot['title'];
      editTodo = TodoModel.fromMap(querySnapshot);
      title.text = editTodo!.title as String;
      description.text = editTodo!.description as String;
      update();
    });
  }

  detailTodo(String id) async {
    if (editTodo != null) {
      editTodo!.title = '';
      editTodo!.description = '';
    }

    update();
    var todos;
    var oneTodo = FirebaseFirestore.instance
        .collection('todo')
        .doc(id)
        .get()
        .then((DocumentSnapshot querySnapshot) {
      var x = querySnapshot['title'];
      editTodo = TodoModel.fromMap(querySnapshot);
      title.text = editTodo!.title as String;
      description.text = editTodo!.description as String;
      update();
      Get.to(detail_todo(), arguments: {
        'todos': editTodo!.title,
        'description': editTodo!.description
      });
    });
  }

  Future updateTodo(id) async {
    return await FirebaseFirestore.instance.collection('todo').doc(id).update({
      'title': title.text,
      'description': description.text,
      'isChecked': false
    }).whenComplete(() {
      title.clear();
      description.clear();

      Get.back();
    })
        // .then((value) => Get.back())
        .catchError((error) => print("Failed to add todo: $error"));
  }

  Future addtodo() async {
    return await collectionReference.add({
      'title': title.text,
      'description': description.text,
      'isChecked': false
    }).whenComplete(() {
      title.clear();
      description.clear();

      Get.back();
    })
        // .then((value) => Get.back())
        .catchError((error) => print("Failed to add todo: $error"));
  }

  String? validteTitle(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some task';
    }
    if (value.length < 6) {
      return 'task must be geater than 4 character';
    }
    return null;
  }

  Future<void> checkBox(String id, bool value) {
    return collectionReference
        .doc(id)
        .update({'isChecked': value})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Future<void> deleteTask(String id) {
    return collectionReference
        .doc(id)
        .delete()
        .then((value) => print("todo deleted"))
        .catchError((error) => print("Failed to delete task: $error"));
  }

  validateForm() {
    final isValid = formKey.currentState!.validate();
    return isValid;
    // formKey.currentState!.save();
  }
}

class my {}
