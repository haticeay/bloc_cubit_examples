import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:bloc_cubit_example/seviye3/repo/user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetUserCubit extends Cubit<List<UserModel>> {
    GetUserCubit() : super([]);

  var repo = UserRepo();

  getAllUsers() async {
    var item = await repo.getUsers();
    emit(item);
  }

   saveUser(String userName, String userNumber)  async{
    await repo.saveUser(userName, userNumber);
  }

  updateUser(String userID, userName, String userNumber) async{
    await repo.updateUser(userID, userName, userNumber);
    getAllUsers();
  }

  deleteUser(UserModel userModel)async{
    await repo.deleteUser(userModel);
    getAllUsers();

  }
}
