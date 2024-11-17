import 'package:bloc_counter/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.isSwitchOn ? Colors.grey.shade300 : Colors.green.shade200,
            title: Text(title, style: TextStyle(
              color: state.isSwitchOn ? Colors.black : Colors.black,
            ),),
            actions: [
              ThemeSwitcher(),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CounterDisplay(),
                SizedBox(height: 20),
                CounterController(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.isSwitchOn ? 'Light Mode' : 'Dark Mode',
              style: TextStyle(
                color: state.isSwitchOn ? Colors.black : Colors.black, fontSize: 18
              ),
            ),
            Switch(
              value: state.isSwitchOn,
              onChanged: (value) {
                context.read<CounterBloc>().add(SwitchEvent());
              },
            ),
          ],
        );
      },
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Text(
          "Count: ${state.counter}",
          style: const TextStyle(fontSize: 24),
        );
      },
    );
  }
}

class CounterController extends StatelessWidget {
  const CounterController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => context.read<CounterBloc>().add(IncrementCounter()),
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Increment",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () => context.read<CounterBloc>().add(DecrementCounter()),
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Decrement",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
