class ProductModel  {
   String? image;
   String? title;
   String? desc;
   num? price;
   int? id;

  ProductModel({required this.image, 
  required this.title,
   required this.desc, required this.price});

  ProductModel.fromJson(Map json){
    image = json['image'];
    title = json['title'];
    desc = json['description'];
    price = json['price'];
    id = json['id'];
  } 
}