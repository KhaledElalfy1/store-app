

import 'package:stor_app/serviecs/api_services.dart';

import '../models/product_model.dart';

class AllProductsServices{

  Future<List<ProductModel>> getAllProducts()
  async {
    dynamic data=await ApiServices().get(url: 'https://fakestoreapi.com/products');

        List<ProductModel> productList=[];



    for(int i=0; i<data.length;i++)
          {

            productList.add(ProductModel.fromjson(data[i]));
          }


        return productList;
      }

  }

