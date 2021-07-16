class AddressObject {
  final name;
  final phone;
  final pincode;
  final city;
  final state;
  final address;
  final locality;
  final type;

  AddressObject(
      {this.name,
      this.phone,
      this.pincode,
      this.city,
      this.state,
      this.address,
      this.locality,
      this.type});
  factory AddressObject.fromJson(Map<String, dynamic> json) => AddressObject(
        name: json["name"],
        phone: json["phone"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        address: json["address"],
        locality: json["locality"],
        type: json["type"],
      );
}
