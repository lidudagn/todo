import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/todol_list.dart/controller.dart';

class detail_todo extends StatefulWidget {
  const detail_todo({super.key});

  @override
  State<detail_todo> createState() => _detail_todoState();
}

class _detail_todoState extends State<detail_todo> {
  Todo_controller controller = Get.put(Todo_controller());
  late String title;
  late String description;
  @override
  void initState() {
    var arguments = Get.arguments as Map<String, dynamic>;
    title = arguments['todos'] as String;
    description = arguments['description'] as String;

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 222, 232),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 115, 153, 219),
        title: Text('Your Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Title: ',
                  style: GoogleFonts.alike(
                      color: Color.fromARGB(255, 115, 153, 219), fontSize: 24),
                ),
                Text(
                  title,
                  style: GoogleFonts.manrope(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Description: ',
                  style: GoogleFonts.alike(
                      color: Color.fromARGB(255, 115, 153, 219), fontSize: 20),
                ),
                Text(
                  description,
                  style: GoogleFonts.manrope(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
