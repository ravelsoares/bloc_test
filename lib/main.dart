import 'package:bloc_pratic/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<HomeBloc>(
              create: (context) => HomeBloc()..add(HomeEventRead()),
              child: HomePage(),
            ),
      // routes: {
      //   '/': (_) => BlocProvider<HomeBloc>(
      //         create: (context) => HomeBloc(),
      //         child: HomePage(),
      //       )
      // },
    );
  }
}


