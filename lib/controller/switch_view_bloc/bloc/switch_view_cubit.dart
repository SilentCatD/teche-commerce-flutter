import 'package:bloc/bloc.dart';
import 'package:teche_commerce/enum/switch_view_type.dart';


class SwitchViewCubit extends Cubit<SwitchViewType> {
  SwitchViewCubit() : super(SwitchViewType.gridView);

  void toggle(SwitchViewType switchViewType) {
    emit(switchViewType);
  }
}
