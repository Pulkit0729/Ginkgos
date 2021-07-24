import 'dart:convert';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.short,
    required this.cutPrice,
    required this.discount,
    required this.image,
    required this.rating,
    required this.size,
  });
  final String id;
  final String name;
  final String short;
  final String size;
  final cutPrice;
  final discount;
  final List<dynamic> image;
  final List<dynamic> rating;
  factory Product.fromJson(json) {
    return Product(
        id: json['ID'].toString(),
        name: json['Name'].toString(),
        short: json['ShortDescription'].toString(),
        cutPrice: json['CostPrice'].toString(),
        discount: json['Discount'].toString(),
        image: jsonDecode(json['Images']),
        rating: jsonDecode(json['Rating']),
        size: json['Size'].toString());
  }
  dynamic get price {
    return ((100 - double.parse(discount)) * double.parse(cutPrice) / 100)
        .toStringAsFixed(0);
  }
}
