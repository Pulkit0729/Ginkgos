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
  factory AddressObject.fromJson(json) => AddressObject(
        name: json["Name"],
        phone: json["Phone"],
        pincode: json["Pincode"],
        city: json["City"],
        state: json["State"],
        address: json["Address"],
        locality: json["Locality"],
        type: json["Type"],
      );
  Map<String, dynamic> toJson() => {
        "Name": name,
        "Phone": phone,
        "Pincode": pincode,
        "City": city,
        "State": state,
        "Address": address,
        "Locality": locality,
        "Type": type
      };
}
