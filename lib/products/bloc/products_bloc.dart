import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/products/models/product_model.dart';
import 'package:test_app/products/repo/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepo productRepo;

  ProductsBloc(this.productRepo) : super(ProductsLoadingState()) {
    on<ProductListLoadedEvent>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productRepo.getProducts();
        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
