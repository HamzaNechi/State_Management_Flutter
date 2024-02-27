import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/blocs/app_blocs.dart';
import 'package:timer/blocs/app_events.dart';
import 'package:timer/blocs/app_states.dart';
import 'package:timer/repositories/user_repositorie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BloC Pattern'),
          centerTitle: true,
        ),

        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if(state is UserLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }


            if(state is UserErrorState){
              return AlertDialog(
                content: Center(
                  child: Text(state.message),
                ),
              );
            }

            if(state is UserLoadedState){
             // print('length of list ${state.userCount}');
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: state.userCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      title: Text(state.users[index].name),
                      leading: const Icon(Icons.person, size: 30,),
                      subtitle: Text(state.users[index].email),
                    );
                  },
                  ),
                );
            }

            return Container();
          },
          ),
      ),
      );
  }
}