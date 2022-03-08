part of 'highlight_product_bloc.dart';

@immutable
abstract class HighlightProductState extends Equatable {}

class HighlightProductInitial extends HighlightProductState {
  @override
  List<Object?> get props => [];
}

class HighlightProductLoading extends HighlightProductState {
  @override
  List<Object?> get props => [];
}

class HighlightProductLoaded extends HighlightProductState {
  final List<Map<String, dynamic>> data;
  HighlightProductLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

class HighlightProductError extends HighlightProductState {
  @override
  List<Object?> get props => [];
}