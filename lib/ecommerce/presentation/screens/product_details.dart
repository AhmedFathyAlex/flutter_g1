import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? ''),),
      body: Center(child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Image.network(product.image ??
               'https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg')),
            Text(product.title ?? 'No title',style: TextStyle(fontSize: 35),),
            Text('${product.price} \$' ?? 'No title',style: TextStyle(fontSize: 20,color: Colors.blue),),
            Text(product.desc ?? 'No title',style: TextStyle(fontSize: 15),),
          ],
        ),
      ),),
    );
  }
}