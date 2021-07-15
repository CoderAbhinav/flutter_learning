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
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: GridTile(
                          header: Container(
                              padding: EdgeInsets.fromLTRB(10, 5, 0, 3),
                              decoration:
                                  BoxDecoration(color: Colors.deepPurple),
                              child: Text(
                                item.name,
                                style: TextStyle(color: Colors.white),
                              )),
                          child: Image.network(
                            item.image,
                          ),
                          footer: Container(
                            padding: EdgeInsets.fromLTRB(10, 3, 0, 5),
                            decoration:
                                BoxDecoration(color: Colors.deepPurple[300]),
                            child: Text(
                              "\$ ${item.price.toString()}",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
