
import 'package:stor_app/serviecs/api_services.dart';

class AllCategoriesServices{
  Future<List<dynamic>> getCategoriesServices() async{

    List<dynamic> data= await ApiServices().get(url: 'https://fakestoreapi.com/products/categories');
      return data;
  }
}