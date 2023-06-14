part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsLoadedState extends ProductsState {
  final List<ProductModel> productModel;
  const ProductsLoadedState(this.productModel);
  @override
  List<Object> get props => [productModel];
}

class ProductErrorState extends ProductsState {
  final String errormsg;
  const ProductErrorState(this.errormsg);
  @override
  List<Object> get props => [errormsg];
}
