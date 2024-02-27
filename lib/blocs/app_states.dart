import 'package:equatable/equatable.dart';
import 'package:timer/models/user_model.dart';

abstract class UserState extends Equatable{}



//data loading state
class UserLoadingState extends UserState{ 
  @override
  List<Object?> get props => [];
}



//data loaded state
class UserLoadedState extends UserState{

  UserLoadedState(this.users,this.userCount);
  int userCount;
  List<UserModel> users;


  @override
  List<Object?> get props => [users,userCount];
}


//data error state
class UserErrorState extends UserState{ 
  UserErrorState(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}