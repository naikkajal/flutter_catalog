import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required Key key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxConsumer(
      builder: (context, _, __) {
        final CartModel _cart = (VxState.store as MyStore).cart;
        bool isInCart = _cart.items.contains(catalog) ?? false;
        return ElevatedButton(
          onPressed: () {
            if (!isInCart) {
              AddMutation(catalog);
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
          ),
          child: isInCart
              ? Icon(Icons.done)
              : Icon(CupertinoIcons.cart_badge_plus),
        );
      },
      mutations: Set.from([AddMutation]), // Provide AddMutation as a Set
    );
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store?.cart.add(item);
  }
}

