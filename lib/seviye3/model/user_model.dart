// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String userName;
  @HiveField(2)
  String userNumber;
  UserModel({
    required this.id,
    required this.userName,
    required this.userNumber,
  });
}
