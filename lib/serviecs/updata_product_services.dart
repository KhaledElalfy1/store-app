import '../models/product_model.dart';
import 'api_services.dart';

class UpdateProduct{
  Future<ProductModel> updateProduct({required String title,required String price, required String des,required String image,required String category,}) async
  {
    Map<String,dynamic>data =await ApiServices().post(url: 'https://fakestoreapi.com/products',
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