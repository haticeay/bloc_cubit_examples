import 'package:bloc/bloc.dart';
import 'package:bloc_cubit_example/seviye1/repo/giris_repo.dart';

class GirisCubit extends Cubit<int> {
  GirisCubit() : super(0);

var repo = GirisRepo();

  arttir()=> emit(repo.arttir(state));
    azalt()=> emit(repo.azalt(state));

  
}