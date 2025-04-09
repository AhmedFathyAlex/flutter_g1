import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/cart_model.dart';
import 'package:flutter_g1/ecommerce/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),),
      body: Center(
        child: Consumer<CartModel>(
          builder: (context, cartModel, child) {
            return ListView.builder(
            itemCount: cartModel.cart.length,
            itemBuilder: (context, index) {
              return ProductCard(product:  cartModel.cart[index]);
            },
          );
          },
        )

      ),
    );
  }
}