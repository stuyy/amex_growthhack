class Merchant {
  final String name;
  final Map<String, dynamic> descriptions;
  final List<String> socialCauses;

  Merchant({this.name, this.descriptions, this.socialCauses});

  factory Merchant.fromJson(Map<String, dynamic> json) {
    return Merchant(
      name: json['name'],
      descriptions: json['descriptions'],
      socialCauses: json['socialCauses'],
    );
  }
}