import 'package:flutter/material.dart';
import 'package:stor_app/models/product_model.dart';
import 'package:stor_app/screens/update_product.dart';

class CustomStack extends StatelessWidget {
   CustomStack({super.key,required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          Navigator.pushNamed(context, UpdateProductPage.id,arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(

            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 40,
                      spreadRadius: 0,
                      offset: Offset(1,1),
                  )]
            ),
            child: Card(
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.title.substring(0,10),
                      style: const TextStyle(color: Colors.grey,
                          fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${product.price} \$',
                          style: const TextStyle(color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        const Icon(Icons.favorite,color: Colors.red,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 20,
              top: -50,
              child: Image.network(product.image,
                height: 120,
                width: 120,
              )
          )
        ],
      ),
    );
  }
}
