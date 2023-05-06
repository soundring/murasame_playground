// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:murasame_playground/ec_app/data/data.dart';
import 'package:murasame_playground/ec_app/model/model.dart';

part 'favorite_state_provider.g.dart';

@riverpod
class FavoriteState extends _$FavoriteState {
  Future<List<Product>> _fetchFavoriteList() async {
    final productList = await LocalStorage.getProductList();
    final favoriteIds = await LocalStorage.getFavoriteIds();

    if (favoriteIds.isEmpty) {
      return [];
    }

    final favoriteProductList = productList
        .where((product) => favoriteIds.contains(product.id))
        .toList();

    return favoriteProductList;
  }

  @override
  Future<List<Product>> build() => _fetchFavoriteList();

  Future<void> addFavorite({required int productId}) async {
    final oldFavoriteIds = await LocalStorage.getFavoriteIds();
    final newFavoriteIds = [...oldFavoriteIds, productId];
    await LocalStorage.setFavoriteIds(productIds: newFavoriteIds);
    _updateState(await _fetchFavoriteList());
  }

  Future<void> removeFavorite({required int productId}) async {
    final oldFavoriteIds = await LocalStorage.getFavoriteIds();
    final newFavoriteIds =
        oldFavoriteIds.where((id) => id != productId).toList();
    await LocalStorage.setFavoriteIds(productIds: newFavoriteIds);
    _updateState(await _fetchFavoriteList());
  }

  _updateState(List<Product> products) {
    state = AsyncValue.data(products);
  }
}
