import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';
import 'package:flutter_g1/ecommerce/presentation/widgets/product_card.dart';
import 'package:http/http.dart' as http;

class AllProducts extends StatefulWidget {
  AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  List<ProductModel> products = [];
  late Future productsFuture;

    @override
  void initState() {
    super.initState();
    productsFuture  = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Commerce')),
      body: Center(
        child: FutureBuilder(
          future: productsFuture,
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          );
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else {
              return Text('Error');
            }
          },
        ),
    
      ),
    );
  }

  Future<void> fetchProducts() async {
      await Future.delayed(Duration(seconds: 2));
      
    final url = 'https://fakestoreapi.com/products';

    http.Response response = await http.get(Uri.parse(url));

      List productsListJson = jsonDecode(response.body);
    
      for(int i = 0 ; i < productsListJson.length ; i++){

        var model = ProductModel.fromJson(productsListJson[i]);

          setState(() {
             products.add(model);
          });
         
      }
    
  }
}
