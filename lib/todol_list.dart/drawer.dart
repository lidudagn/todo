import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightBlue[900],
          ),
          child: SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
              ),
              child: Column(
                children: [
                  const SizedBox(),
                  AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Success is never getting to',
                          textStyle: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20)),
                      TyperAnimatedText(' the bottom of your to-do list!',
                          textStyle: const TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20)),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
