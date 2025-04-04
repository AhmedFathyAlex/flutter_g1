import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';
import 'package:flutter_g1/ecommerce/presentation/widgets/product_card.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.cartItems});
  final List<ProductModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),),
      body: Center(
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ProductCard(product: cartItems[index]);
          },
        ),
      ),
    );
  }
}