// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      imagePath: json['imagePath'] as String,
      stock: json['stock'] as int,
      star: (json['star'] as num).toDouble(),
      reviewCount: json['reviewCount'] as int,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imagePath': instance.imagePath,
      'stock': instance.stock,
      'star': instance.star,
      'reviewCount': instance.reviewCount,
    };
