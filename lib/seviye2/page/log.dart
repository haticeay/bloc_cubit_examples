import 'package:bloc_cubit_example/seviye2/cubit/switch_cubit.dart';
import 'package:bloc_cubit_example/seviye2/cubit/user_cubit.dart';
import 'package:bloc_cubit_example/seviye2/model/user_model.dart';
import 'package:bloc_cubit_example/seviye2/page/user_home.dart';
import 'package:bloc_cubit_example/seviye2/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  bool deger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seviye 2 "),
      ),
      body: Center(
        child: Column(
          children: [
            SbtTextfield(controller: nameController, label: "name"),
            SbtTextfield(controller: passwordController, label: "password"),
            BlocBuilder<SwitchCubit, bool>(builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  state ? const Text('Admin') : const Text('Person'),
                  Switch(
                      value: state,
                      onChanged: (state) {
                        context.read<SwitchCubit>().durumuDegistir();
                      })
                ],
              );
            }),
            ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      passwordController.text.isEmpty) {
                    var userModel = UsersModel(
                        name: nameController.text,
                        password: passwordController.text);
                    context.read<UserCubit>().userKaydet(userModel);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeScreen()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserHomeScreen()));
                  }
                },
                child: const Text("Kaydet"))
          ],
        ),
      ),
    );
  }
}
