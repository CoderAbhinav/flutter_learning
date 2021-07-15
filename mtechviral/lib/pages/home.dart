import 'package:flutter/material.dart';
import 'package:mtechviral/widgets/drawer.dart';
import 'package:mtechviral/models/catalogue.dart';
import 'package:mtechviral/widgets/iteam_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogModel.items[index],
              );
            }),
      ),
    );
  }
}
