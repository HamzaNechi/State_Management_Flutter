import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inheritedwidget/models/product.dart';
import 'package:inheritedwidget/panier.dart';
import 'package:inheritedwidget/shoppingcart.dart';

class Home extends StatelessWidget {
  
  List<Product> products = List.generate(100, (index) {
    return Product(name: 'product $index', price: Random().nextInt(5000), isCheck: false);
  });

  @override
  Widget build(BuildContext context) {

    ShoppingCart? cart = ShoppingCart.of(context);

    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping cart', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
          actions: [
            Stack(
              children: [

                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white
                    ),

                    child: Center(child: Text('${cart!.products.length}', style: const TextStyle(color: Colors.black87),)),
                  ),
                ),


                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Panier(),));
                }, icon: const Icon(Icons.shopify_rounded, color: Colors.white, size: 25,)),

                
              ],
            )
          ],
        ),

        body:Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(5),
                  title: Text(products[index].name , style:const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  subtitle: Text('${products[index].price.toString()} DT' , style:const TextStyle(color: Colors.black45, fontSize: 17, fontWeight: FontWeight.w400),),
                  trailing: Checkbox(value: products[index].isCheck, onChanged: (value) {
                    setState(() {
                      products[index].isCheck = !products[index].isCheck;
                      if(products[index].isCheck){
                        cart.products.add(products[index]);
                      }else{
                        cart.products.remove(products[index]);
                      }
                    },);
                  },),
                ),
                );
            },),
          ),
      );
    },);
  }
}