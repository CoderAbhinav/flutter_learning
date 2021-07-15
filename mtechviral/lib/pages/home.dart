import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtechviral/widgets/drawer.dart';
import 'package:mtechviral/models/catalogue.dart';
import 'package:mtechviral/widgets/iteam_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 3));
    final catalogJSON =
        await rootBundle.loadString("android/assets/files/catalog.json");
    var catalogDecode = jsonDecode(catalogJSON);
    var prdcat = catalogDecode["products"];
    CatalogModel.items =
        List.from(prdcat).map<Item>((e) => Item.fromMap(e)).toList();

    setState(() {});
  }

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
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
