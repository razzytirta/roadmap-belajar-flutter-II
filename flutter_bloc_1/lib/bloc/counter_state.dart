part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

class CounterValue extends CounterState {
  final int value;

  const CounterValue(this.value);

  @override
  List<Object> get props => [value];
}
