import 'dart:convert';

class Product {
  const Product({
    this.sellerId,
    required this.id,
    required this.name,
    required this.short,
    required this.price,
    required this.discount,
    required this.image,
    required this.rating,
    required this.height,
    required this.diameter,
  });
  final String id;
  final String name;
  final String short;
  final String height;
  final String diameter;
  final String? sellerId;
  final price;
  final discount;
  final List<dynamic> image;
  final List<dynamic> rating;
  factory Product.fromJson(json) {
    return Product(
        id: json['ID'].toString(),
        name: json['Name'].toString(),
        sellerId: json['SellerId'].toString(),
        short: json['ShortDescription'].toString(),
        price: json['SellingPrice'].toString(),
        discount: json['Discount'].toString(),
        image: jsonDecode(json['Images']),
        rating: jsonDecode(json['Rating']),
        height: json['Height'].toString(),
        diameter: json['Diameter'].toString());
  }
  dynamic get cutPrice {
    return (100 * double.parse(price) / (100 - double.parse(discount)))
        .toStringAsFixed(0);
  }
}
