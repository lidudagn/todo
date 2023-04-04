// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:todo/model/todo_model.dart';

// class FirestoreDb {
//   static addTodo(TodoModel todomodel) async {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//     await firebaseFirestore.collection('todos').add({
//       'content': todomodel.content,
//       'createdon': Timestamp.now(),
//       'isDone': false,
//     });
//   }

//   static Stream<List<TodoModel>> todoStream() {
//     FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
//     return firebaseFirestore
//         .collection('todos')
//         .snapshots()
//         .map((QuerySnapshot query) {
//       List<TodoModel> todos = [];
//       for (var todo in query.docs) {
//         final todoModel =
//             TodoModel.fromDocumentSnapshot(documentSnapshot: todo);
//         todos.add(todoModel);
//       }
//       print(todos);
//       return todos;
//     });
//   }

//   // static updateStatus(bool isDone, documentId) {
//   //   firebaseFirestore
//   //       .collection('users')
//   //       .doc(auth.currentUser!.uid)
//   //       .collection('todos')
//   //       .doc(documentId)
//   //       .update(
//   //     {
//   //       'isDone': isDone,
//   //     },
//   //   );
//   // }
//   // static deleteTodo(String documentId) {
//   //   firebaseFirestore
//   //       .collection('users')
//   //       .doc(auth.currentUser!.uid)
//   //       .collection('todos')
//   //       .doc(documentId)
//   //       .delete();
//   // }
// }
