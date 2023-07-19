import 'package:flutter/material.dart';
import 'package:stor_app/component/custom_button.dart';
import 'package:stor_app/component/custom_textfiled.dart';
import 'package:stor_app/models/product_model.dart';

import '../serviecs/updata_product_services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
   UpdateProductPage({super.key});
  static String id='updateProduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName,des,image;

   String? price;
   bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall:isLoading ,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100,),

                CustomTextFiled(hintText: 'Update product name',
                  onChange: (data){
                  productName=data;
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFiled(hintText: 'description',
                  onChange: (data){
                  des=data;
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFiled(hintText: 'price',inputType: TextInputType.number,
                  onChange: (data){
                  price=data;
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextFiled(hintText: 'image',
                  onChange: (data){
                    image=data;
                  },),
                const SizedBox(height: 50,),
                CustomButton(text: 'Update',
                  onTap: () async {
                    isLoading=true;
                    setState(() {

                    });
                    try {
                     await updateProduct(product);
                    }  catch (e) {
                      print(e.toString());

                    }
                    isLoading=false;
                    setState(() {

                    });
                  },

                ),

              ],
            ),
          ),
        ),

      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
  await  UpdateProductServices().updateProduct(
    id: product.id,
        title: productName==null ? product.title :productName! ,
        price: price==null ? product.price.toString() : price!,
        des: des==null ? product.description : des!,
        image: image==null ? product.image : image!,
        category: product.category!);

  }
}
