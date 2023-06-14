abstract class CounterState {}

class CounterInitialState extends CounterState {
  final int count;
  CounterInitialState(this.count);
}

class CounterIncrementState extends CounterState {
  final int count;
  CounterIncrementState(this.count);
}

class CounterDecrementState extends CounterState {
  final int count;
  CounterDecrementState(this.count);
}
