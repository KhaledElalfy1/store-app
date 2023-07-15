
import 'package:stor_app/serviecs/api_services.dart';

import '../models/product_model.dart';

class AllGetCategoriesServices{

  Future<List<ProductModel>> getCategory(String categoryName)async{

    List<dynamic> data= await ApiServices().get(url: 'https://fakestoreapi.com/products/category/$categoryName');
      List<ProductModel> productList=[];
      for(int i=0; i<data.length;i++)
      {
        productList.add(data[i]);
      }
      return productList;

  }
}