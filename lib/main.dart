import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_and_cupertino_widgets/pages/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
            home: CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text("Cupertino App"),
              ),
              child: Center(
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text("Cupertino Button"),
                ),
              ),
            ),
          )
        : const MaterialApp(
            title: 'Flutter Demo',
            home: Homepage(),
          );
  }
}
