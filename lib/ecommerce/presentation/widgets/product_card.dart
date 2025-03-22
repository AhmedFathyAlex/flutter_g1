import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key,required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.all(10),
              height: 250,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.grey.shade300
              ),
              child: Column(
                children: [
                 Container(
                    height: 65,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7)
                      ),
                      image: DecorationImage(
                        image: NetworkImage(product.image!),
                        fit: BoxFit.cover
                      )
                    ),
                 ),
                 Text(product.title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),maxLines: 1,),
                 Text(product.desc!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),maxLines: 1,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${product.price}\$',style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart))
                  ],
                 )
                ],
              ),
            );
  }
}