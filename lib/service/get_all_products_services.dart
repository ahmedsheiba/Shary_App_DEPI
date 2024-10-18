import 'package:sharyApp/helper/api.dart';
import 'package:sharyApp/models/product_model.dart';

class AllProductServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];

    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    print(data);
    return productList;
  }
}
