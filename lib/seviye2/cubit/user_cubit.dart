import 'package:bloc_cubit_example/seviye2/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit  extends Cubit<UsersModel?>{

  UserCubit() : super(null);

  userKaydet(UsersModel userModel) => emit(userModel);
  
}