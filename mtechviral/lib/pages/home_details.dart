import 'package:flutter/material.dart';
import 'package:mtechviral/utils/myTheme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mtechviral/models/catalogue.dart';

class HomeDetails extends StatelessWidget {
  final Item catalog;

  const HomeDetails({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myTheme.creamColor,
        title: "${catalog.name}".text.make(),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          children: [
            "\$ ${catalog.price}".text.xl4.bold.make(),
            ElevatedButton(
              onPressed: () {
                print("Sold : ${catalog.name}");
              },
              child: "Buy".text.xl3.make(),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(myTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(200, 60)
          ],
        ),
      ),
      body: Column(
        children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
                  height: 30.0,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.bold.make(),
                        catalog.desc.text.xl2.gray400.make(),
                      ],
                    ).py64(),
                  )))
        ],
      ),
    );
  }
}
