import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class UserRepo {
  var db= Hive.box<UserModel>('dbuser');

  List<UserModel> allUsers = [];
  Future <void> saveUser (String userName, String userNumber) async{

    String userID = const Uuid().v1();

    UserModel newUser= UserModel(id: userID, userName: userName, userNumber: userNumber);
    await db.put(userID, newUser);
  }

Future<List<UserModel>> getUsers () async{

if (db.isNotEmpty) {
  allUsers =db.values.toList();
  return allUsers;
} else{
  return allUsers;
}
}

 Future <void> updateUser ( String userID ,String userName, String userNumber) async{

    String userID = const Uuid().v1();

    UserModel newUser= UserModel(id: userID, userName: userName, userNumber: userNumber);
    await db.put(userID, newUser);
  }

  Future <void> deleteUser(UserModel userModel) async {
    await db.delete(userModel.id);
  }



}