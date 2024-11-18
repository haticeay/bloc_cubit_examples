import 'package:bloc_cubit_example/seviye3/cubit/get_user.dart';
import 'package:bloc_cubit_example/seviye3/model/user_model.dart';
import 'package:bloc_cubit_example/seviye3/page/add_user_page.dart';
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
        title: Text("Cubit Örnek"),
      ),
      body: Center(
        child: BlocBuilder<GetUserCubit, List<UserModel>>(
          builder: (context, state) {
            if (state.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    UserModel item = state[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.userName),
                        subtitle: Text(item.userNumber),
                      ),
                    );
                  });
            } else {
              return const Text("Görüntülenecek kişi yok");
            }
          },
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
