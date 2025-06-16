class ProductModel {
  final String category;
  final String description;
  final String discount;
  final String id;
  final String img;
  final String price;
  final String stars;
  final String title;
  final String url;

  ProductModel({
    required this.category,
    required this.description,
    required this.discount,
    required this.id,
    required this.img,
    required this.price,
    required this.stars,
    required this.title,
    required this.url,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      category: json['Category'],
      description: json['Description'],
      discount: json['Discount'],
      id: json['ID'],
      img: json['Img'],
      price: json['Price'],
      stars: json['Stars'],
      title: json['Title'],
      url: json['Url'],
    );
  }
}
 