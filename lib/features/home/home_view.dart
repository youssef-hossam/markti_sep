import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:markti/features/home/models/product_model.dart';
import 'package:markti/main.dart';

class HomeView extends StatelessWidget {
  List<ProductModel> products = [];
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                    itemCount: snapshot.data!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(children: [
                          Image.network(snapshot.data![index].thumbnail??'',
                              height: 100, width: 100),
                          Text(snapshot.data![index].title??''),
                          // Text(snapshot.data![index]['description']),
                          Text(snapshot.data![index].price.toString()),
                        ]),
                      );
                    });
              }

              return Container();
            }));
  }

  Future<List<ProductModel>> getAllProducts() async {
    final response = await Dio().get('https://dummyjson.com/products');
    for (var product in response.data['products']) {
      ProductModel productModel = ProductModel.fromJson(product);

      products.add(productModel);
    }
    return products;
  }
}
