// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MaterialExampleScreen extends StatefulWidget {
  const MaterialExampleScreen({super.key});

  @override
  _MaterialExampleScreenState createState() => _MaterialExampleScreenState();
}

class _MaterialExampleScreenState extends State<MaterialExampleScreen> {
  bool switchValue = false;
  double sliderValue = 0.5;
  DateTime selectedDate = DateTime.now();
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material Widgets Example"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Material Button
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("Material Alert"),
                    content:
                        const Text("This is a Material-style alert dialog."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Alert"),
            ),

            const SizedBox(height: 20),

            // Material Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Material Switch"),
                Switch(
                  value: switchValue,
                  onChanged: (value) {
                    setState(() => switchValue = value);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Material Slider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Material Slider"),
                Slider(
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

            // Date Picker
            ElevatedButton(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  setState(() => selectedDate = pickedDate);
                }
              },
              child: Text("Pick Date: ${selectedDate.toLocal()}".split(' ')[0]),
            ),

            const SizedBox(height: 20),

            // Circular Progress Indicator
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Circular Progress Indicator"),
                SizedBox(width: 10),
                CircularProgressIndicator(),
              ],
            ),

            const SizedBox(height: 20),

            // Material Text Field
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                labelText: "Material TextField",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Bottom Sheet
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: 200,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bottom Sheet",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text("This is a Material bottom sheet."),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text("Show Bottom Sheet"),
            ),

            const SizedBox(height: 20),

            // Material Snackbar
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("This is a Material Snackbar!"),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        // Code to execute.
                      },
                    ),
                  ),
                );
              },
              child: const Text("Show Snackbar"),
            ),

            const SizedBox(height: 20),

            // Dropdown Button
            DropdownButton<String>(
              hint: const Text("Choose an option"),
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),

            const SizedBox(height: 20),

            // Material Popup Menu Button
            PopupMenuButton<String>(
              onSelected: (String result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Selected: $result")),
                );
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
              ],
              child: ElevatedButton(
                child: const Text("Show Popup Menu"),
                onPressed: () {},
              ),
            ),

            const SizedBox(height: 20),

            // Floating Action Button
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Floating Action Button Pressed!")),
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
