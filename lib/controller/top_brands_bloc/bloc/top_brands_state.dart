part of 'top_brands_bloc.dart';

abstract class TopBrandsState extends Equatable {
  const TopBrandsState();
}

class TopBrandsInitial extends TopBrandsState {
  @override
  List<Object> get props => [];
}

class TopBrandsFetching extends TopBrandsState {
  @override
  List<Object?> get props => [];
}

class TopBrandsFetched extends TopBrandsState {
  final List<Brand> brands;

  const TopBrandsFetched({required this.brands});
  @override
  List<Object?> get props => [brands];
}

class TopBrandsFetchError extends TopBrandsState{
  @override
  List<Object?> get props => [];
}
