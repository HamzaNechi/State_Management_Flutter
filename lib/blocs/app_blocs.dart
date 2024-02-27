import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/blocs/app_events.dart';
import 'package:timer/blocs/app_states.dart';
import 'package:timer/repositories/user_repositorie.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserLoadingState()){
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());

      try{
        final users= await _userRepository.getUsers();
        final uc = users.length;
        emit(UserLoadedState(users, uc));
      }catch(e){
        emit(UserErrorState(e.toString()));
      }
      
    });
  }

}