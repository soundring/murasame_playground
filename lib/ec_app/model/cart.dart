// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'product.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  factory Cart({
    required List<CartItem> cartItemList,
  }) = _Cart;

  Cart._();

  int get totalPrice => cartItemList.fold(
        0,
        (previousValue, newValue) =>
            previousValue + newValue.quantity * newValue.product.price,
      );

  int get totalQuantity => cartItemList.fold(
        0,
        (previousValue, newValue) => previousValue + newValue.quantity,
      );
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required Product product,
    required int quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, Object?> json) =>
      _$CartItemFromJson(json);
}
