import 'package:flutter/material.dart';
import 'package:mtechviral/pages/home_details.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mtechviral/utils/myTheme.dart';
import 'package:mtechviral/models/catalogue.dart';
import 'package:mtechviral/utils/routes.dart';

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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetails(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(imgSrc: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.bold.make(),
            catalog.desc.text.gray400.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.fromLTRB(0, 0, 9, 0),
              children: [
                "\$ ${catalog.price}".text.xl.bold.make(),
                ElevatedButton(
                  onPressed: () {
                    print("Sold : ${catalog.name}");
                  },
                  child: "Add to Cart".text.make(),
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
