import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/todol_list.dart/controller.dart';

edit_todo(id) {
  Todo_controller controller = Get.put(Todo_controller());
  controller.onetodo(id);

  Get.defaultDialog(
    title: "Edit your tasks",
    content: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: TextFormField(
                      controller: controller.title,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: ' hfdsd,',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      validator: (value) {
                        return controller.validteTitle(value!);
                      }),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  // height: 40,
                  color: Colors.white,
                  child: TextFormField(
                      controller: controller.description,
                      minLines: 5,
                      maxLines: 8,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Task',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        contentPadding: EdgeInsets.all(8),
                      ),
                      validator: (value) {
                        controller.validteTitle(value!);
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.red),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // if (controller.validateForm()) {
                        //   controller.addtodo();
                        // }
                        controller.onetodo(id);
                        // var res = await controller.onetodo(id);
                        // print(res);
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.white),
                      child: Text(
                        "Save",
                        style: TextStyle(
                            color: Colors.lightBlue[900], fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
    backgroundColor: Colors.lightBlue[900],
    titleStyle: const TextStyle(color: Colors.white),
    radius: 20,
  );
}
