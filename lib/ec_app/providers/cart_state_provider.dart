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
    return await LocalStorage.getCartItemList();
  }

  @override
  Future<List<CartItem>> build() async => await _fetchCartItemList();

  Future<void> addCartItem({required int productId}) async {
    final productList = await LocalStorage.getProductList();
    final product =
        productList.firstWhere((product) => product.id == productId);

    final oldCartItemList = await LocalStorage.getCartItemList();
    final newCartItemList = [
      ...oldCartItemList,
      CartItem(product: product, quantity: 1)
    ];

    await LocalStorage.setCartItemList(newCartItemList);
    _updateState(newCartItemList);
  }

  _updateState(List<CartItem> cartItems) {
    state = AsyncValue.data(cartItems);
  }
}
