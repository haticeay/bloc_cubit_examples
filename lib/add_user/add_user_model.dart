import 'package:bloc_cubit_example/add_user/add_user_page.dart';
import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/page/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AddUserViewModel on State<AddUserPage> {
  //değişkenler
  var nameController = TextEditingController();
  var numberController = TextEditingController();

  //initstate
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //butonlar
  kaydetButonClick() {
    context
        .read<GetUserCubit>()
        .saveUser(nameController.text, numberController.text.toString());
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
