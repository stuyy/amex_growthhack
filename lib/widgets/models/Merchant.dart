class Merchant {
  final String name;
  final Map<String, dynamic> descriptions;
  final List<String> socialCauses;
  final Map<String, dynamic> location;

  Merchant({this.name, this.descriptions, this.socialCauses, this.location});

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      name: json['name'],
      descriptions: json['descriptions'],
      socialCauses: json['socialCauses'],
      location: json['location'],
    );
  }
}