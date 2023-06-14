import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/products/bloc/products_bloc.dart';
import 'package:test_app/widgets/circular_loader.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductListLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Screen"),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState) {
              return const CircularLoader();
            } else if (state is ProductsLoadedState) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.productModel.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          Text(state.productModel[index].category.toString()),
                    );
                  });
            } else if (state is ProductErrorState) {
              return Center(child: Text(state.errormsg.toString()));
            }
            return const SizedBox();
          },
        ));
  }
}
