import 'package:bloc/bloc.dart';

class ProductPageViewCubit extends Cubit<int> {
  ProductPageViewCubit() : super(0);

  void switchPage(int index) {
    emit(index);
  }
}
