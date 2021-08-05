import 'package:go_green/backend/models/cartCondition.dart';

class PriceDetailsObject {
  final totalPrice;
  final discount;
  final couponDiscount;
  final deliverCharges;
  final totalAmount;
  final totalItems;

  PriceDetailsObject({
    this.totalPrice,
    this.discount,
    this.couponDiscount,
    this.deliverCharges,
    this.totalAmount,
    this.totalItems,
  });

  factory PriceDetailsObject.fromList(
      List list, List quantity, coupon, CartConditions cartConditions) {
    var _discount = 0.0;
    var _totalPrice = 0.0;
    var deliveryCharge;
    var _couponDiscount = coupon;

    for (var i = 0; i < list.length; i++) {
      _discount = _discount +
          ((list[i]['Discount']) *
                  list[i]['SellingPrice'] /
                  (100 - list[i]['Discount'])) *
              quantity[i];
      _totalPrice = _totalPrice +
          (100 * list[i]['SellingPrice'] / (100 - list[i]['Discount'])) *
              quantity[i];
    }

    if (1 * quantity.fold(0, (p, c) => p + c) < 3) {
      deliveryCharge = int.parse(cartConditions.deliveryCharge) *
          quantity.fold(0, (p, c) => p + c);
    } else {
      deliveryCharge = int.parse(cartConditions.maxDelivery);
    }

    var _totalAmount =
        _totalPrice + deliveryCharge - _discount - _couponDiscount;

    return PriceDetailsObject(
        totalPrice: _totalPrice.toInt().toString(),
        discount: _discount.toInt().toString(),
        deliverCharges: deliveryCharge.toInt().toString(),
        couponDiscount: _couponDiscount.toInt().toString(),
        totalAmount: _totalAmount.toInt().toString(),
        totalItems: (1 * quantity.fold(0, (p, c) => p + c)).toInt().toString());
  }

  factory PriceDetailsObject.fromJson(json) {
    return PriceDetailsObject(
        totalAmount: json['TotalAmount'],
        totalPrice: json['TotalPrice'],
        deliverCharges: json['DeliveryCharge'],
        couponDiscount: json['CouponDiscount'],
        discount: json['Discount'],
        totalItems: json['TotalItems']);
  }
  Map<String, dynamic> toJson() => {
        "TotalPrice": totalPrice,
        "Discount": discount,
        "CouponDiscount": couponDiscount,
        "DeliveryCharge": deliverCharges,
        "TotalAmount": totalAmount,
        "TotalItems": totalItems
      };
}
