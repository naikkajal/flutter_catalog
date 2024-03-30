import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widgets/catalog_list.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogModel {
  static List<Item> items = []; 
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
  try {
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    if (decodedData.containsKey("products")) {
      var productsData = decodedData["products"] as List<dynamic>;
      CatalogModel.items = productsData
          .where((item) => item != null) // Filter out null items
          .map<Item>((item) => Item.fromMap(item ?? {}))
          .toList();
      setState(() {});
    } else {
      throw Exception("Products key not found in JSON data");
    }
  } catch (e) {
    print("Error loading catalog data: $e");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("Failed to load catalog data. Please try again later."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}



      

    @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: MyTheme.creamColor,
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
      backgroundColor: MyTheme.darkBluishColor,
      child: Icon(CupertinoIcons.cart),
    ),
    body: SafeArea(
      child: Container(
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().expand(),
          ],
        ),
      ),
    ),
  );
}

  }