import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// Entry point of the app
void main() {
  runApp(MyApp());
}

// 1. Stateless Widget (Assumed it won't change during runtime)
// 2. Stateful Widget (Assumed that it will change during runtime)

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start Up',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _faqs = [];
  final _editingController = TextEditingController();

  void _addFaq() {
    print("Text: ${_editingController.text}");
    setState(() {
      _faqs.add(_editingController.text);
      _editingController.clear();
    });
  }

  void _removeElement(int index) {
    setState(() {
      _faqs.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Startup FAQ")),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 56),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _faqs.length,
                itemBuilder: (context, index) => GFListTile(
                  avatar: GFAvatar(),
                  titleText: _faqs[index],
                  subTitle: Text('Hey I am a cool ${_faqs[index]}'),
                  icon: GFButton(
                    text: "Delete",
                    onPressed: () => _removeElement(index),
                  ),
                ),
              ),
            ),
            TextFormField(
              controller: _editingController,
              decoration: InputDecoration(
                suffix: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _addFaq,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
