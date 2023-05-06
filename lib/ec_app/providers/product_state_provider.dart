// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:murasame_playground/ec_app/data/data.dart';
import 'package:murasame_playground/ec_app/model/model.dart';

part 'product_state_provider.g.dart';

@riverpod
class ProductState extends _$ProductState {
  Future<List<Product>> _fetchProductList() async {
    return await LocalStorage.getProductList();
  }

  @override
  Future<List<Product>> build() async => await _fetchProductList();
}
