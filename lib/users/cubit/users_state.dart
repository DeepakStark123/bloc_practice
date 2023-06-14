part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UsersModel> userModelList;
  const UsersLoadedState(this.userModelList);
  @override
  List<Object> get props => [userModelList];
}

class UsersErrorState extends UsersState {
  final String errorMessage;
  const UsersErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
