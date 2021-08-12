import 'dart:convert';

class Product {
  const Product({
    required this.sellerId,
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
  final String sellerId;
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

class DescriptionObject {
  final String category;
  final String? water;
  final String? light;
  final String? idealLocation;
  final String? description;
  final String? height;
  final String? diameter;
  final String sellerId;
  final String withPot;

  DescriptionObject(
      {required this.category,
      this.water,
      this.light,
      this.idealLocation,
      required this.description,
      this.height,
      this.diameter,
      required this.withPot,
      required this.sellerId});

  factory DescriptionObject.fromJson(json) {
    print(json['Light']);
    return DescriptionObject(
        category: json['Category'],
        water: json['Water'],
        light: json['Light'],
        idealLocation: json['IdealLocation'],
        description: json['Description'],
        height: json['Height'],
        diameter: json['Diameter'],
        sellerId: json['SellerId'],
        withPot: json['WithPot'].toString());
  }
}
