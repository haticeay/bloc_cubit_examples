import 'package:bloc_cubit_example/seviye1/cubit/giris_cubit.dart';
import 'package:bloc_cubit_example/seviye1/widget/builder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisSayfasi extends StatelessWidget {
  const GirisSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: 
    AppBar(
      title: const Text("Home"),
    ),
    body: Center(
      child: Column(
        children: [
          const GirisBuilderTextWidget(),
          ElevatedButton(onPressed: (){
            context.read<GirisCubit>().azalt();
          }, child: const Text("Azalt"))
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      context.read<GirisCubit>().arttir();
    }),
    );
  }


}