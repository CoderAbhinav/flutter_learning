import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtechviral/utils/myTheme.dart';
import 'package:mtechviral/widgets/drawer.dart';
import 'package:mtechviral/models/catalogue.dart';
import 'package:mtechviral/widgets/iteam_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: myTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator().expand(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(myTheme.darkBluishColor).make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(imgSrc: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.gray400.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              children: [
                "\$ ${catalog.price}".text.xl.bold.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "Buy".text.make(),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(myTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).roundedSM.white.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String imgSrc;

  const CatalogImage({Key? key, required this.imgSrc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imgSrc)
        .box
        .roundedSM
        .p16
        .color(myTheme.creamColor)
        .make()
        .p8()
        .w32(context);
  }
}
