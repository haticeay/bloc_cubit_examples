import 'package:bloc_cubit_example/seviye2/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit  extends Cubit<UserModel?>{

  UserCubit() : super(null);

  userKaydet(UserModel userModel) => emit(userModel);
  
}