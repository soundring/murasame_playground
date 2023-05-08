// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
    required List<int> favoriteProductIds,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, Object?> json) =>
      _$FavoriteFromJson(json);
}
