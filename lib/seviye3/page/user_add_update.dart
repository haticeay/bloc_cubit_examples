import 'package:bloc_cubit_example/constant/textfield.dart';
import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:bloc_cubit_example/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAddUpdate extends StatefulWidget {
  final UserModel userModel;
  const UserAddUpdate({super.key, required this.userModel});

  @override
  State<UserAddUpdate> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<UserAddUpdate> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.userModel.userName;
    numberController.text = widget.userModel.userNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi  Düzenleme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SbtTextfield(controller: nameController, label: "isim"),
             const  SizedBox(
                height: 24,
              ),
              SbtTextfield(
                controller: numberController,
                label: "Numaranız",
                klavyeNumber: true,
              ),
              const  SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<GetUserCubit>().updateUser(widget.userModel.id, nameController.text, numberController.text.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Text("Güncelle")),
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      backgroundColor:  Colors.redAccent
                    ),
                      onPressed: () {
                        context.read<GetUserCubit>().deleteUser(widget.userModel);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      },
                      child: const Text("Sil"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
