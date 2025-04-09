import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/models/product_model.dart';

class CartModel extends ChangeNotifier{
   // observable class
  List<ProductModel> cart = [];
  List<ProductModel> products = [];

   addToCart(ProductModel model){
    cart.add(model);
    notifyListeners();
  }

  removeAll(){
    cart.clear();
    notifyListeners();
  }

  addToProducts(List<ProductModel> models){
    products.addAll(models);
    notifyListeners();
  }

}