// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String id;
  final String imagePath;
  final String marketingName;
  final String deviceRam;
  final String deviceStorage;
  final String deviceCondition;
  final bool verified;
  final int? originalPrice;
  final int? discountedPrice;
  final double? discountPercentage;
  final bool openForNegotiation;
  final String listingDate;
  final String listingLocation;
  final String listingState;
  final String listingPrice;
  ProductModel({
    required this.id,
    required this.imagePath,
    required this.marketingName,
    required this.deviceRam,
    required this.deviceStorage,
    required this.deviceCondition,
    required this.verified,
    this.originalPrice,
    this.discountedPrice,
    this.discountPercentage,
    required this.openForNegotiation,
    required this.listingDate,
    required this.listingLocation,
    required this.listingState,
    required this.listingPrice,
  });

  ProductModel copyWith({
    String? id,
    String? imagePath,
    String? marketingName,
    String? deviceRam,
    String? deviceStorage,
    String? deviceCondition,
    bool? verified,
    int? originalPrice,
    int? discountedPrice,
    double? discountPercentage,
    bool? openForNegotiation,
    String? listingDate,
    String? listingLocation,
    String? listingState,
    String? listingPrice,
  }) {
    return ProductModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      marketingName: marketingName ?? this.marketingName,
      deviceRam: deviceRam ?? this.deviceRam,
      deviceStorage: deviceStorage ?? this.deviceStorage,
      deviceCondition: deviceCondition ?? this.deviceCondition,
      verified: verified ?? this.verified,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      openForNegotiation: openForNegotiation ?? this.openForNegotiation,
      listingDate: listingDate ?? this.listingDate,
      listingLocation: listingLocation ?? this.listingLocation,
      listingState: listingState ?? this.listingState,
      listingPrice: listingPrice ?? this.listingPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imagePath': imagePath,
      'marketingName': marketingName,
      'deviceRam': deviceRam,
      'deviceStorage': deviceStorage,
      'deviceCondition': deviceCondition,
      'verified': verified,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
      'discountPercentage': discountPercentage,
      'openForNegotiation': openForNegotiation,
      'listingDate': listingDate,
      'listingLocation': listingLocation,
      'listingState': listingState,
      'listingPrice': listingPrice,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] as String,
      imagePath: map['imagePath'] as String,
      marketingName: map['marketingName'] as String,
      deviceRam: map['deviceRam'] as String,
      deviceStorage: map['deviceStorage'] as String,
      deviceCondition: map['deviceCondition'] as String,
      verified: map['verified'] as bool,
      originalPrice:
          map['originalPrice'] != null ? map['originalPrice'] as int : null,
      discountedPrice:
          map['discountedPrice'] != null ? map['discountedPrice'] as int : null,
      discountPercentage: map['discountPercentage'] != null
          ? map['discountPercentage'] as double
          : null,
      openForNegotiation: map['openForNegotiation'] as bool,
      listingDate: map['listingDate'] as String,
      listingLocation: map['listingLocation'] as String,
      listingState: map['listingState'] as String,
      listingPrice: map['listingPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, imagePath: $imagePath, marketingName: $marketingName, deviceRam: $deviceRam, deviceStorage: $deviceStorage, deviceCondition: $deviceCondition, verified: $verified, originalPrice: $originalPrice, discountedPrice: $discountedPrice, discountPercentage: $discountPercentage, openForNegotiation: $openForNegotiation, listingDate: $listingDate, listingLocation: $listingLocation, listingState: $listingState, listingPrice: $listingPrice)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.imagePath == imagePath &&
        other.marketingName == marketingName &&
        other.deviceRam == deviceRam &&
        other.deviceStorage == deviceStorage &&
        other.deviceCondition == deviceCondition &&
        other.verified == verified &&
        other.originalPrice == originalPrice &&
        other.discountedPrice == discountedPrice &&
        other.discountPercentage == discountPercentage &&
        other.openForNegotiation == openForNegotiation &&
        other.listingDate == listingDate &&
        other.listingLocation == listingLocation &&
        other.listingState == listingState &&
        other.listingPrice == listingPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        imagePath.hashCode ^
        marketingName.hashCode ^
        deviceRam.hashCode ^
        deviceStorage.hashCode ^
        deviceCondition.hashCode ^
        verified.hashCode ^
        originalPrice.hashCode ^
        discountedPrice.hashCode ^
        discountPercentage.hashCode ^
        openForNegotiation.hashCode ^
        listingDate.hashCode ^
        listingLocation.hashCode ^
        listingState.hashCode ^
        listingPrice.hashCode;
  }
}
