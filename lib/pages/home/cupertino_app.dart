import 'dart:developer';

import 'package:flutter/cupertino.dart';

class MyCupertinoApp extends StatefulWidget {
  @override
  State<MyCupertinoApp> createState() => _MyCupertinoAppState();
}

class _MyCupertinoAppState extends State<MyCupertinoApp> {
  @override
  bool switchValue = false;

  double sliderValue = 0.5;

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Cupertino Widgets Example"),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Cupertino Button
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    title: const Text("Cupertino Alert"),
                    content: const Text("This is an iOS-style alert dialog."),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      CupertinoDialogAction(
                        child: const Text("OK"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Alert"),
            ),

            const SizedBox(height: 20),

            // Cupertino Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoSwitch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() => switchValue = value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Cupertino Slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoSlider(
                  value: sliderValue,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (value) {
                    setState(() => sliderValue = value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Cupertino Date Picker
            CupertinoButton(
              color: CupertinoColors.systemPurple,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => Container(
                    height: 300,
                    color: CupertinoColors.systemBackground,
                    child: CupertinoDatePicker(
                      initialDateTime: selectedDate,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (dateTime) {
                        setState(() => selectedDate = dateTime);
                      },
                    ),
                  ),
                );
              },
              child: Text("Pick Date: ${selectedDate.toLocal()}".split(' ')[0]),
            ),

            const SizedBox(height: 20),

            // Cupertino Activity Indicator
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                CupertinoActivityIndicator(),
              ],
            ),

            const SizedBox(height: 20),

            // Cupertino Text Field
            const CupertinoTextField(
              placeholder: "Cupertino TextField",
              padding: EdgeInsets.all(12),
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Cupertino Search Text Field
            const CupertinoSearchTextField(
              placeholder: "Cupertino Search",
            ),

            const SizedBox(height: 20),

            // Cupertino Context Menu
            Center(
              child: CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: const Text("Action 1"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  CupertinoContextMenuAction(
                    child: const Text("Action 2"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
                child: Container(
                  width: 100,
                  height: 100,
                  color: CupertinoColors.activeBlue,
                  alignment: Alignment.center,
                  child: const Text("Hold Me"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Cupertino Action Sheet
            CupertinoButton(
              color: CupertinoColors.activeGreen,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => CupertinoActionSheet(
                    title: const Text("Cupertino Action Sheet"),
                    message: const Text("Choose an option"),
                    actions: [
                      CupertinoActionSheetAction(
                        child: const Text("Option 1"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoActionSheetAction(
                        child: const Text("Option 2"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text("Cancel"),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                );
              },
              child: const Text("Show Action Sheet"),
            ),

            const SizedBox(height: 20),

            // Cupertino Picker
            CupertinoButton(
              color: CupertinoColors.activeOrange,
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (_) => Container(
                    height: 300,
                    color: CupertinoColors.systemBackground,
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        log("Selected item: $index");
                      },
                      children: List.generate(
                        5,
                        (index) => Center(child: Text("Item $index")),
                      ),
                    ),
                  ),
                );
              },
              child: const Text("Show Cupertino Picker"),
            ),
          ],
        ),
      ),
    );
  }
}
