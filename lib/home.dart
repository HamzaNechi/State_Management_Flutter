import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateBuilder', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Center(
        child: myCounter(context)
      ),
    );
  }


/// Avec cette méthode la reconstruction de widget tree commence a partir du widget StatefulBuilder
/// et ne faire pas reconstruire à partir du Scaffold comme setState

  Widget myCounter(BuildContext context){
    return StatefulBuilder(
      builder: (context, setState) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {
              setState(() {
                counter--;
              },);
            }, icon: const Icon(Icons.minimize_outlined,  color: Colors.red, size: 25,)),

            
           Text(counter.toString(), style: const TextStyle(fontSize: 25),),

            IconButton(onPressed: () {
              setState(() {
                counter++;
              },);
            }, icon: const Icon(Icons.add,  color: Colors.red, size: 25,)),
          ],
        )
      );
  }
}