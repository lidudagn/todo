import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/todol_list.dart/addTodo.dart';
import 'package:todo/todol_list.dart/controller.dart';

import 'package:todo/todol_list.dart/drawer.dart';
import 'package:todo/todol_list.dart/editTodo.dart';

class todo extends StatefulWidget {
  @override
  State<todo> createState() => _todoState();
}

class _todoState extends State<todo> {
  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    Todo_controller controller = Get.put(Todo_controller());
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 222, 232),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 115, 153, 219),
          leading: Builder(
            builder: ((context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.list_outlined),
              );
            }),
          )),
      drawer: const drawer(),
      body: Obx(
        () => SafeArea(
            child: ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (BuildContext context, int index) => Column(
                      children: <Widget>[
                        LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            if (controller.todos[index].title!.isNotEmpty)

                              // ignore: curly_braces_in_flow_control_structures
                              return InkWell(
                                onTap: () {
                                  controller.detailTodo(
                                      controller.todos[index].docId!);
                                },
                                child: Card(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  margin: const EdgeInsets.all(15),
                                  color: Colors.white,
                                  shadowColor:
                                      Color.fromARGB(255, 115, 153, 219),
                                  elevation: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Title: ',
                                              style: GoogleFonts.alike(
                                                  color: Color.fromARGB(
                                                      255, 115, 153, 219),
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              controller.todos[index].title!,
                                              style: GoogleFonts.manrope(
                                                  fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 14),
                                          child: LayoutBuilder(
                                            builder: (BuildContext context,
                                                BoxConstraints constraints) {
                                              if (controller.todos[index]
                                                      .description?.length ==
                                                  0) {
                                                return Text('');
                                              } else {
                                                return Row(
                                                  children: [
                                                    Text(
                                                      'description : ',
                                                      style: GoogleFonts.alike(
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              115, 153, 219),
                                                          fontSize: 16),
                                                    ),
                                                    Text(
                                                      controller.todos[index]
                                                          .description!,
                                                      style:
                                                          GoogleFonts.manrope(
                                                              fontSize: 13),
                                                    )
                                                  ],
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Checkbox(
                                                    shape: CircleBorder(),
                                                    checkColor: Colors
                                                        .white, // color of tick Mark
                                                    activeColor: Color.fromARGB(
                                                        255, 115, 153, 219),
                                                    value: controller
                                                        .todos[index]
                                                        .isChecked!,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        controller.checkBox(
                                                            controller
                                                                .todos[index]
                                                                .docId!,
                                                            value!);

                                                        controller.todos[index]
                                                            .isChecked = value;
                                                      });
                                                    }),
                                                LayoutBuilder(
                                                  builder:
                                                      (BuildContext context,
                                                          BoxConstraints
                                                              constraints) {
                                                    if (controller.todos[index]
                                                            .isChecked ==
                                                        false) {
                                                      return Text(
                                                        'Incomplete task',
                                                        style:
                                                            GoogleFonts.raleway(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12),
                                                      );
                                                    }
                                                    return Text(
                                                      'Complete task',
                                                      style:
                                                          GoogleFonts.raleway(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 12),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    edit_todo(controller
                                                        .todos[index].docId);
                                                    // controller.onetodo(controller
                                                    //     .todos[index].docId!);
                                                    // edit_todo(
                                                    //   controller
                                                    //       .todos[index].docId!,
                                                    // );
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Color.fromARGB(
                                                        255, 115, 153, 219),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 7,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    controller.deleteTask(
                                                        controller.todos[index]
                                                            .docId!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Color.fromARGB(
                                                        255, 196, 6, 6),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ))),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 115, 153, 219),
        foregroundColor: Colors.black,
        onPressed: () {
          add_todo();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
    // });
  }
}
