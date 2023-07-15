import 'package:flutter/material.dart';
import 'package:stor_app/models/product_model.dart';

class CustomStack extends StatelessWidget {
   CustomStack({super.key,/*required this.product*/});
  // ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(

          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 40,
                    spreadRadius: 0,
                    offset: Offset(1,1)

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
                  Text('Handbag',
                    style: TextStyle(color: Colors.grey,
                        fontSize: 18
                    ),
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('15\$',
                        style: TextStyle(color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                      Icon(Icons.favorite,color: Colors.red,)
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
            child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
              height: 120,)
        )
      ],
    );
  }
}
