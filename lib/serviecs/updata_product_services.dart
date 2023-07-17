import '../models/product_model.dart';
import 'api_services.dart';

class UpdateProductServices{
  Future<ProductModel> updateProduct({required String title,
    required String price,
    required String des,
    required int id,
    required String image,
    required String category,}) async
  {
    Map<String,dynamic>data =await ApiServices().put(url: 'https://fakestoreapi.com/products/$id',
        body: {
          'title': title,
          'price': price,
          'description': des,
          'image': image,
          'category': category
        });
    return ProductModel.fromjson(data);
  }
}