import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stor_app/models/product_model.dart';
import 'package:stor_app/serviecs/all_product_services.dart';

import '../component/custom_stack.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id ='Homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('New trend',style: TextStyle(color: Colors.black),),
        actions: [
         IconButton(onPressed: (){}, icon:  const Icon(FontAwesomeIcons.cartPlus,color: Colors.black,))
        ],
        leading: const Icon(CupertinoIcons.back,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0,left: 8,top: 60),
        child: FutureBuilder<List <ProductModel>>(
          future: AllProductsServices().getAllProducts(),
          builder: (context,snapshot){
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount:snapshot.data!.length,
                  clipBehavior: Clip.none,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ) ,

                  itemBuilder: (context,index){
                    return CustomStack(product:snapshot.data![index]);
                  }
              );
            }
            else
              {
                return Center(child: CircularProgressIndicator());
              }

          },
        ),

        ),
      );
  }
}
