// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/services.dart' show rootBundle;

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:murasame_playground/ec_app/model/model.dart';

class LocalStorage {
  // 商品
  static Future<List<Product>> getProductList() async {
    final sampleData =
        await rootBundle.loadString('lib/ec_app/sample_data/sample_data.json');

    final productList = jsonDecode(sampleData) as List;

    return productList
        .map((product) => Product.fromJson(product as Map<String, dynamic>))
        .toList();
  }

  static Future<void> saveProductList({required List<Product> products}) async {
    final prefs = await SharedPreferences.getInstance();
    final json =
        jsonEncode(products.map((product) => product.toJson()).toList());
    await prefs.setString('products', json);
  }

  // お気に入り
  static Future<List<int>> getFavoriteIds() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('favorite');

    if (json == null) {
      return [];
    }

    final favoriteList = jsonDecode(json) as List;
    return favoriteList.map((favorite) => favorite as int).toList();
  }

  static Future<void> setFavoriteIds({required List<int> productIds}) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(productIds);
    await prefs.setString('favorite', json);
  }

  // カート
  static Future<List<CartItem>> getCartItemList() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('cart');

    if (json == null) {
      return [];
    }

    final cartItemList = jsonDecode(json) as List;
    return cartItemList
        .map((cartItem) => CartItem.fromJson(cartItem as Map<String, dynamic>))
        .toList();
  }

  static Future<void> setCartItemList(
      {required List<CartItem> cartItemList}) async {
    final prefs = await SharedPreferences.getInstance();
    final json =
        jsonEncode(cartItemList.map((cartItem) => cartItem.toJson()).toList());
    await prefs.setString('cart', json);
  }
}
