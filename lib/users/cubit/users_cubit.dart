import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/users/model/users_model.dart';
import 'package:test_app/users/users_repo/users_repo.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo userRepo;
  UsersCubit(this.userRepo) : super(UsersLoadingState());

  getUserData() async {
    try {
      emit(UsersLoadingState());
      var data = await userRepo.getUserData();
      emit(UsersLoadedState(data));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
