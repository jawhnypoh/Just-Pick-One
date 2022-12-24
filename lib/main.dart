import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just Pick One!',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Just Pick One!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<TextEditingController> textControllersList = [];
  List<TextField> textFieldsList = [];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              Text('Welcome! Add some options below to continue',
                  style: TextStyle(color: Colors.grey[350], fontSize: 25.0),
                  textAlign: TextAlign.center),
              const Padding(padding: EdgeInsets.only(bottom: 20.0)),
              // buildTextFieldWidget(),
              // buildTextFieldWidget(),
              // buildTextFieldWidget(),
              Expanded(child: textFieldsListView()),
              addTextFieldButton(),
              doneButton(),
              const Padding(padding: EdgeInsets.only(bottom: 20.0))
            ],
          )),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  @override
  void dispose() {
    for (final textController in textControllersList) {
      textController.dispose();
    }
    super.dispose();
  }

  Widget textFieldWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Ex. Netflix and Chill',
        ),
      ),
    );
  }

  Widget textFieldsListView() {
    return ListView.builder(
      itemCount: textFieldsList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(5),
          child: textFieldsList[index],
        );
      },
    );
  }

  Widget addTextFieldButton() {
    return ListTile(
      title: Icon(Icons.add, color: Colors.grey[350]),
      onTap: () {
        final controller = TextEditingController();
        final field = TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "name${textControllersList.length + 1}",
          ),
        );

        setState(() {
          textControllersList.add(controller);
          textFieldsList.add(field);
        });
      },
    );
  }

  Widget doneButton() {
    return ElevatedButton(onPressed: () {}, child: const Text("DONE"));
  }
}
