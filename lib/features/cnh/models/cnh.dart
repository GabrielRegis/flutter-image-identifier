import 'dart:convert';

class CNH {
  final String? cpfNumber;
  final String? name;
  final String? idNumber;
  final String? cnhNumber;
  const CNH({
    this.cpfNumber,
    this.name,
    this.idNumber,
    this.cnhNumber,
  });

  static CNH fromEncodedJson(String encoded) {
    return fromJson(
      jsonDecode(encoded),
    );
  }

  static CNH fromJson(Map<String, dynamic> json) {
    return CNH(
      cpfNumber: json['cpfNumber'] as String,
    );
  }
}
