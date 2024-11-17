import 'package:equatable/equatable.dart';

// Define Counter State
class CounterState extends Equatable {
  final int counter;
  final bool isSwitchOn;

  const CounterState({this.counter = 0, this.isSwitchOn = false});

  CounterState copyWith({int? counter, bool? isSwitchON}) {
    return CounterState(
      counter: counter ?? this.counter,
      isSwitchOn: isSwitchON ?? this.isSwitchOn,
    );
  }

  @override
  List<Object?> get props => [counter, isSwitchOn];
}
