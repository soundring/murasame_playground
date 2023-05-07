// Package imports:
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

    await LocalStorage.setCartItemList(cartItemList: newCartItemList);
    _updateState(newCartItemList);
  }

  _updateState(List<CartItem> cartItems) {
    state = AsyncValue.data(cartItems);
  }

  Future<void> removeCartItem({required int productId}) async {
    final oldCartItemList = await LocalStorage.getCartItemList();
    final newCartItemList = oldCartItemList
        .where((cartItem) => cartItem.product.id != productId)
        .toList();

    await LocalStorage.setCartItemList(cartItemList: newCartItemList);
    _updateState(newCartItemList);
  }

  Future<void> changeCartItemQuantity(
      {required int productId, required int quantity}) async {
    final oldCartItemList = await LocalStorage.getCartItemList();
    final newCartItemList = oldCartItemList.map((cartItem) {
      if (cartItem.product.id == productId) {
        return cartItem.copyWith(quantity: quantity);
      } else {
        return cartItem;
      }
    }).toList();

    await LocalStorage.setCartItemList(cartItemList: newCartItemList);
    _updateState(newCartItemList);
  }

  int totalPrice() {
    final cartItemList = state.asData?.value ?? [];
    final totalPrice = cartItemList.fold(0, (sum, cartItem) {
      return sum + cartItem.product.price * cartItem.quantity;
    });
    return totalPrice;
  }

  int totalQuantity() {
    final cartItemList = state.asData?.value ?? [];
    final totalQuantity = cartItemList.fold(0, (sum, cartItem) {
      return sum + cartItem.quantity;
    });
    return totalQuantity;
  }
}
