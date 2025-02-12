// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BrandModel {
  final String make;
  final String imagePath;
  BrandModel({
    required this.make,
    required this.imagePath,
  });

  BrandModel copyWith({
    String? make,
    String? imagePath,
  }) {
    return BrandModel(
      make: make ?? this.make,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'make': make,
      'imagePath': imagePath,
    };
  }

  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(
      make: map['make'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) =>
      BrandModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BrandModel(make: $make, imagePath: $imagePath)';

  @override
  bool operator ==(covariant BrandModel other) {
    if (identical(this, other)) return true;

    return other.make == make && other.imagePath == imagePath;
  }

  @override
  int get hashCode => make.hashCode ^ imagePath.hashCode;
}
