import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:markti/core/api/api_error_handler.dart';
import 'package:markti/features/home/models/product_model.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  // bussiness logic here

  getAllProduct() async {
    try {
      emit(ProductsLoading());
      List<ProductModel> products = [];

      final response = await Dio().get('https://dummyjson.com/products');
      for (var product in response.data['products']) {
        ProductModel productModel = ProductModel.fromJson(product);

        products.add(productModel);
      }
      emit(ProductsSucess(products: products));

    
    } on DioException catch (e) {
      String errorMessage = handleApiError(e);

      emit(ProductsFailure(errorMessage: errorMessage));
      // TODO
    }
  }
}
