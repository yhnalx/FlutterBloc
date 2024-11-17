import 'package:bloc_counter/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/bloc/counter_bloc/counter_state.dart';
import 'package:bloc_counter/views/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: state.isSwitchOn
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}


