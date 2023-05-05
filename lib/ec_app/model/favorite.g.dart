// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Favorite _$$_FavoriteFromJson(Map<String, dynamic> json) => _$_Favorite(
      favoriteProductIds: (json['favoriteProductIds'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_FavoriteToJson(_$_Favorite instance) =>
    <String, dynamic>{
      'favoriteProductIds': instance.favoriteProductIds,
    };
