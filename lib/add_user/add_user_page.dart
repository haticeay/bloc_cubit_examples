import 'package:bloc_cubit_example/add_user/add_user_model.dart';
import 'package:bloc_cubit_example/constant/textfield.dart';
import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> with AddUserViewModel {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Ekle Sayfası"),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text("Kişi Ekle", style: TextStyle(fontSize: 24),),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              SbtTextfield(controller:nameController , label: "isim"),
             const SizedBox(
                height: 20,
              ),
              SbtTextfield(controller: numberController, label: "Numaranız",
              klavyeNumber: true,
              ),
               const SizedBox(
                height: 24,
              ),
              ElevatedButton(onPressed: ()=> kaydetButonClick, child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}