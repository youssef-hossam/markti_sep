import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markti/features/home/cubit/products_cubit.dart';
import 'package:markti/features/home/models/product_model.dart';
import 'package:markti/main.dart';

class HomeView extends StatelessWidget {
  List<ProductModel> products = [];
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => ProductsCubit()..getAllProduct(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is ProductsSucess) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => Card(
                      child: Column(children: [
                        Image.network(state.products[index].thumbnail!,
                            width: 100, height: 100),
                        Text(state.products[index].title!),
                        Text(state.products[index].price.toString()),
                      ]),
                    ));
          }

          return Container();
        },
      ),
    ));
  }

  // Future<List<ProductModel>> getAllProducts() async {
  //   final response = await Dio().get('https://dummyjson.com/products');
  //   for (var product in response.data['products']) {
  //     ProductModel productModel = ProductModel.fromJson(product);

  //     products.add(productModel);
  //   }
  //   return products;
  // }
}
