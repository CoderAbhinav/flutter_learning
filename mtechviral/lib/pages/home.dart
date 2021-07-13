import 'package:flutter/material.dart';
import 'package:mtechviral/widgets/drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.deepPurple,
        title: Text("Catologue"),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
