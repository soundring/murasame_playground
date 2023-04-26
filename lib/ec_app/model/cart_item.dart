// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import 'product.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  factory CartItem({
    required Product product,
    required int quantity,
  }) = _CartItem;

  CartItem._();

  CartItem increment() => copyWith(quantity: quantity + 1);
}
