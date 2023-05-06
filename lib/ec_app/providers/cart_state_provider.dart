// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './product_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:murasame_playground/ec_app/data/data.dart';
import 'package:murasame_playground/ec_app/model/model.dart';

part 'cart_state_provider.g.dart';

@riverpod
class CartState extends _$CartState {
  _fetchCartItemList() async {
    final productList = await LocalStorage.getProductList();
    final cartItemList = await LocalStorage.getCartItemList();

    final cartItemProductList = cartItemList.map((cartItem) {
      final product = productList
          .firstWhere((product) => product.id == cartItem.product.id);
      return CartItem(product: product, quantity: cartItem.quantity);
    }).toList();

    return cartItemProductList;
  }

  @override
  Future<List<CartItem>> build() => _fetchCartItemList();
}
