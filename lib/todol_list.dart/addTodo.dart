import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/todol_list.dart/controller.dart';

add_todo() {
  Todo_controller controller = Get.put(Todo_controller());
  return Get.defaultDialog(
      title: "Add your tasks",
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
              child: Container(
                // height: 40,
                color: Colors.white,
                child: TextFormField(
                    controller: controller.title,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
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
          const  SizedBox(
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
                  onPressed: () {
                    print(controller.validateForm());
                    if (controller.validateForm()) {
                      controller.addtodo();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      primary: Colors.white),
                  child: Text(
                    "Save",
                    style:
                        TextStyle(color: Colors.lightBlue[900], fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[900],
      titleStyle: const TextStyle(color: Colors.white),
      radius: 20);
}
