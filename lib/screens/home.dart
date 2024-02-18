import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state/bloc/counter_bloc.dart';
import 'package:state/events/counter_event.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc cb = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter" , style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              IconButton(onPressed: () {
                cb.add(Decrement());
              }, icon: const Icon(Icons.remove, size: 20,)),


              BlocBuilder<CounterBloc, int>(builder: (context, state) {
                return Text(state.toString(), style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 20),);
              },),
              


              IconButton(onPressed: () {
                cb.add(Increment());
              }, icon: const Icon(Icons.add, size: 20,)),
            ],
          )
        ],
      ),
    );
  }
}