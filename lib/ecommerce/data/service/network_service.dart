import 'dart:convert';
import 'dart:developer';


import 'package:flutter_g1/ecommerce/data/models/product_model.dart';
import 'package:http/http.dart' as http;
class NetworkService{
  static Future<List<ProductModel>> fetchProducts() async {
    List<ProductModel> products = [];
    final url = 'https://fakestoreapi.com/products';

    http.Response response = await http.get(Uri.parse(url));  
    log(response.body);

    List productsListJson = jsonDecode(response.body);
    for (int i = 0; i < productsListJson.length; i++) {
      var model = ProductModel.fromJson(productsListJson[i]);
      products.add(model);
    }
    return products;
  }
  
}