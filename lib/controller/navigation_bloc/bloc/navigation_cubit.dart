import 'package:bloc/bloc.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit([int initialScreen = 0]) : super(initialScreen);

  void changeScreen(int index) {
    if (index < 0 || index > 3) {
      throw Exception("Screen range out of bound");
    }
    emit(index);
  }
}
