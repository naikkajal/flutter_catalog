import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        print("Item at index $index: $catalog"); // Debugging statement
        return CatalogItem(
          key: ValueKey(catalog.id),
          catalog: catalog,
        );
      },
    );
  }
}


class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => HomeDetailPage(
      catalog: catalog,
      key: ValueKey(catalog.id), // Use a non-null key
    ),
  ),
),

      child: VxBox(
        child: Row(
          children: [
            Hero(
              tag: "catalog_${catalog.id}", // Use a unique tag for each catalog item
              child: Image.network(
                catalog.image,
                height: 150,
                width: 150,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyTheme.darkBluishColor,
                          ),
                          shape: MaterialStateProperty.all(
                            StadiumBorder(),
                          ),
                        ),
                        child: "Add to cart".text.make(),
                      )
                    ],
                  ).pOnly(right: 8.0)
                ],
              ),
            )
          ],
        ),
      ).white.rounded.square(150).make().py16(),
    );
  }
}
