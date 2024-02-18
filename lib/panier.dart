import 'package:flutter/material.dart';
import 'package:inheritedwidget/shoppingcart.dart';

class Panier extends StatelessWidget {
  const Panier({super.key});
  
  @override
  Widget build(BuildContext context) {
    ShoppingCart? cart= ShoppingCart.of(context);

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Details', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
        iconTheme: const IconThemeData(color: Colors.white),
         
      ),

      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: cart!.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(5),
                  title: Text(cart.products[index].name , style:const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  subtitle: Text('${cart.products[index].price.toString()} DT' , style:const TextStyle(color: Colors.black45, fontSize: 17, fontWeight: FontWeight.w400),),
                  trailing: IconButton(onPressed: () {
                    cart.products.remove(cart.products[index]);
                  }, icon: const Icon(Icons.delete, color: Colors.red, size: 25,)),
                ),
                );
            },),
          ),
    );
  }
}