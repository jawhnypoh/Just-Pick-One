// Selection Screen for User Options

import 'package:flutter/material.dart';
import 'package:just_pick_one/views/ResultsView.dart';

class SelectionView extends StatelessWidget {
  const SelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // TODO: Dynamically change title based on dinner, movies, things to do
        title: Text('Just Pick One!'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          optionViewContainer(),
          rowContainerForSelectionButtons(context),
          const Padding(padding: EdgeInsets.only(bottom: 20.0))
        ]),
      ),
    );
  }

  Widget optionViewContainer() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          'Dinner at McDonalds',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 60.0),
        ),
      ),
    );
  }

  Widget rowContainerForSelectionButtons(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [checkMarkButton(context), cancelButton()]),
    );
  }

  Widget checkMarkButton(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultsView()));
        },
        child: const Icon(
          Icons.check_rounded,
          size: 100.0,
          color: Colors.green,
        ));
  }

  Widget cancelButton() {
    return OutlinedButton(
        onPressed: () {},
        child: const Icon(
          Icons.clear_rounded,
          size: 100.0,
          color: Colors.redAccent,
        ));
  }
}
