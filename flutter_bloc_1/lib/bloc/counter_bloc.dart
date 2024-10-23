import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is Increment) {
        if (state is CounterInitial) {
          emit(const CounterValue(0));
        } else {
          emit(CounterValue((state as CounterValue).value + 1));
        }
      }
    });
  }
}
