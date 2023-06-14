import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxToggleState> {
  CheckboxCubit() : super(CheckboxToggleState(false));
  toggleChcekBox(bool newVal) {
    emit(CheckboxToggleState(newVal));
  }
}
