import 'package:bloc/bloc.dart';

class CarouselIndicatorCubit extends Cubit<int> {
  CarouselIndicatorCubit() : super(0);

  void changeCarousel(int index) {
    emit(index);
  }
}
