import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:bloc_cubit_example/add_user/add_user_page.dart';
import 'package:bloc_cubit_example/seviye3/page/user_add_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetUserCubit>().getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Örnek"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          
          child: BlocBuilder<GetUserCubit, List<UserModel>>(
            builder: (context, state) {
              if (state.isNotEmpty) {
                return ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      UserModel item = state[index];
                      return Card(
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> UserAddUpdate(userModel: item)));
                          },
                          title: Text(item.userName),
                          subtitle: Text(item.userNumber),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                        ),
                      );
                    });
              } else {
                return const Text("Görüntülenecek kişi yok");
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context )=>const AddUserPage()));
      },
      child: const Icon(Icons.group_add_sharp),
      
      
      ),
    );
  }
}
