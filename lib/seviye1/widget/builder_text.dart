import 'package:bloc_cubit_example/seviye1/cubit/giris_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisBuilderTextWidget extends StatelessWidget {
  const GirisBuilderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GirisCubit, int>(builder: (context, state) {
      return Text(state.toString());
      
    },);
  }
}