import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text("Catologue"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
