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

  factory PriceDetailsObject.fromList(List list, List quantity, coupon) {
    var _discount = 0.0;
    var _totalPrice = 0.0;
    for (var i = 0; i < list.length; i++) {
      _discount = _discount +
          (list[i]['CostPrice'] * list[i]['Discount'] / 100) * quantity[i];
      _totalPrice = _totalPrice + list[i]['CostPrice'] * quantity[i];
    }
    var _couponDiscount = coupon;
    var _totalAmount = _totalPrice +
        20 * quantity.fold(0, (p, c) => p + c) -
        _discount -
        _couponDiscount;
    return PriceDetailsObject(
        totalPrice: _totalPrice.toString(),
        discount: _discount.toString(),
        deliverCharges: (20 * quantity.fold(0, (p, c) => p + c)).toString(),
        couponDiscount: _couponDiscount.toString(),
        totalAmount: _totalAmount.toString(),
        totalItems: (1 * quantity.fold(0, (p, c) => p + c)).toString());
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
