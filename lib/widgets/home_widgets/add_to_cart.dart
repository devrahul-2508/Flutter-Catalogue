import 'package:flutter/material.dart';
import 'package:flutter_catalogue/core/store.dart';
import '../../models/cart.dart';
import '../../models/catalogue.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required this.catalog,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, DeleteMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        child: isInCart ? Icon(Icons.done) : "Buy".text.make(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        )).w16(context);
  }
}
