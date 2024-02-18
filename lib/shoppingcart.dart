import 'package:flutter/material.dart';
import 'package:inheritedwidget/models/product.dart';
import 'package:collection/collection.dart';

class ShoppingCart extends InheritedWidget {
  
  List<Product> products = [];
  Widget child;

  ShoppingCart({
    required this.child,
    Key? key,
  }) : super(key: key, child: child);

  

  @override
  bool updateShouldNotify(ShoppingCart oldWidget) {
    return !const IterableEquality().equals(products, oldWidget.products);
  }

  static ShoppingCart? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShoppingCart>();
  }
}