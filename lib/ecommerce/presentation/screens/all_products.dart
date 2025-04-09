import 'package:flutter/material.dart';
import 'package:flutter_g1/ecommerce/data/service/network_service.dart';
import 'package:flutter_g1/ecommerce/data/cart_model.dart';
import 'package:flutter_g1/ecommerce/presentation/screens/cart.dart';
import 'package:flutter_g1/ecommerce/presentation/widgets/product_card.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  

  late Future productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = NetworkService.fetchProducts();
    productsFuture.then((productsList){
      context.read<CartModel>().addToProducts(productsList);
    });
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
                      builder: (context) => Cart(),
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
                child: Consumer<CartModel>(
                  builder: (context, cartModel, child) {
                    return Text('${cartModel.cart.length}',style: TextStyle(fontSize: 10),);
                  },
                  )),
            ],
          ),
           IconButton(
                onPressed: () {
                context.read<CartModel>().removeAll();
                },
                icon: Icon(Icons.delete),
              ),
        ],
      ),
      body: Center(
        child: Consumer<CartModel>(
          builder: (context, cartModel, child) {
           return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: cartModel.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                     isInCart:  cartModel.cart.contains(cartModel.products[index]),
                     product: cartModel.products[index],
                     onAddToCart: () {
                          cartModel.addToCart(cartModel.products[index]);
                     },
                     );
                  },
                );
          }, 
        )
      ),
    );
  }


}
