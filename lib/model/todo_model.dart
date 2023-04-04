import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String? docId;
  String? title;
  String? description;
  bool? isChecked;
  TodoModel({ this.docId, this.title, this.description, this.isChecked});
  TodoModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    title = data['title'];
    description = data['description'];
    isChecked = data['isChecked']as bool;
  }
}
