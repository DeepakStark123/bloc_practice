part of 'checkbox_cubit.dart';

abstract class CheckboxState extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckboxToggleState extends CheckboxState {
  final bool checkbox;
  CheckboxToggleState(this.checkbox);

  @override
  List<Object> get props => [checkbox];
}
