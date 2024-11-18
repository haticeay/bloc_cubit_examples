import 'package:bloc_cubit_example/seviye1/cubit/giris_cubit.dart';
import 'package:bloc_cubit_example/seviye1/page/giris_page.dart';
import 'package:bloc_cubit_example/seviye2/cubit/switch_cubit.dart';
import 'package:bloc_cubit_example/seviye2/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GirisCubit(),
          
        ),
          BlocProvider(
          create: (context) => SwitchCubit(),
          
        ),
         BlocProvider(
          create: (context) => UserCubit(),
          
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GirisSayfasi(),
      ),
    );
  }
}
