// Results Screen to show User Selections

import 'package:flutter/material.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            // TODO: Dynamically change title based on dinner, movies, things to do
            title: Text('Results')));
  }
}
