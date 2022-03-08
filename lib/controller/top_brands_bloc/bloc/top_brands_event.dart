part of 'top_brands_bloc.dart';

abstract class TopBrandsEvent extends Equatable {
  const TopBrandsEvent();
}

class TopBrandsFetch extends TopBrandsEvent {
  @override
  List<Object?> get props => [];
}
