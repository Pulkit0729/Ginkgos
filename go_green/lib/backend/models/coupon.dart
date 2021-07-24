import 'package:firebase_database/firebase_database.dart';

class Coupon {
  final name;
  final percentage;
  final maximumDiscount;
  final minimumAmount;
  final noOfTime;

  Coupon(
      {this.name,
      this.percentage,
      this.maximumDiscount,
      this.minimumAmount,
      this.noOfTime});

  factory Coupon.fromJson(json) {
    return Coupon(
      name: json['name'],
      percentage: json['discount'],
      minimumAmount: json['valid_price'],
      maximumDiscount: json['max_discount'],
      noOfTime: json['times'],
    );
  }
}

Future<List<Coupon>> coupons() async {
  List<Coupon> list = [];
  var result = await FirebaseDatabase.instance
      .reference()
      .child('Promocodes')
      .get()
      .then((value) => value!.value);
  result.forEach((k, v) => list.add(Coupon.fromJson(v)));
  return list;
}
