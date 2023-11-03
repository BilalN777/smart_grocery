class Store {
  String? name;
  String? address;
  int? zipcode;
  String? location;
  int? id;

  // string has to match json
  Map<String, dynamic> toMap() {
    return {
      'Store name': name,
      'Address': address,
      'Zip': zipcode,
      'Location' : location,
      'store_id': id,
    };
  }

  Store({
    required this.name,
    required this.address,
    required this.zipcode,
    required this.location,
    this.id
  });


  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['Store Name'],
      address: map['Address'],
      zipcode: map['Zip'],
      location: map['Location'],
      id: map['store_id'],
    );
  }


}