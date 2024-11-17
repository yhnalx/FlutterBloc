import 'package:bloc/bloc.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_incrementCounter);
    on<DecrementCounter>(_decrementCounter);
    on<SwitchEvent>(_switchEvent);
  }

  void _incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    if(state.counter > 0) {
      emit(state.copyWith(counter: state.counter - 1));
    }
  }

  void _switchEvent(SwitchEvent event, Emitter<CounterState> emit) {
    emit(state.copyWith(isSwitchON: !state.isSwitchOn));
  }
}
