import 'package:bloc_cubit_example/seviye1/cubit/giris_cubit.dart';
import 'package:bloc_cubit_example/seviye1/page/giris_page.dart';
import 'package:bloc_cubit_example/seviye2/cubit/switch_cubit.dart';
import 'package:bloc_cubit_example/seviye2/cubit/user_cubit.dart';
import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:bloc_cubit_example/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future <void> main() async {
  await Hive.initFlutter();

  //user veri tabanı
  Hive.registerAdapter(UsersModelAdapter());
  await Hive.openBox<UserModel>('dbuser');
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
         BlocProvider(
          create: (context) => GetUserCubit(),
          
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
