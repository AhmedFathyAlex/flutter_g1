import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';
import 'package:flutter_g1/ecommerce/data/service/network_service.dart';
import 'package:flutter_g1/ecommerce/presentation/screens/cart.dart';
import 'package:flutter_g1/ecommerce/presentation/widgets/product_card.dart';
import 'package:http/http.dart' as http;

class AllProducts extends StatefulWidget {
  AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<ProductModel> products = [];
  List<ProductModel> cart = [];
  late Future productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = NetworkService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart(cartItems: cart),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle
                ),
                child: Text('${cart.length}',style: TextStyle(fontSize: 10),)),
            ],
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              products = snapshot.data as List<ProductModel>;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    isInCart: cart.contains(products[index]),
                    product: products[index],
                    onAddToCart: () {
                      setState(() {
                        cart.add(products[index]);
                      });
                    },
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text('Error');
            }
          },
        ),
      ),
    );
  }


}
