import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cupertino_app.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCupertinoApp()));
            },
            child: const Text("Cupertino Button"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Material Button"),
          )
        ],
      ),
    ));
  }
}

// Widget adaptiveButton(String text, VoidCallback onPressed) {
//   if (Platform.isIOS) {
//     return CupertinoButton(
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   } else {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }
// }
