// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'account_page.dart';
import 'cart_page.dart';
import 'favorite_page.dart';
import 'product_page.dart';
import 'search_page.dart';

final List<String> _appBarTitle = ['ムラサメ家具', 'お気に入り', 'カート', 'アカウント'];

final List<Widget> _pageList = <Widget>[
  const ProductPage(),
  // const SearchPage(),
  const FavoritePage(),
  const CartPage(),
  const AccountPage()
];

const _bottomNavigationBarItem = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'ホーム',
  ),
  // BottomNavigationBarItem(
  //   icon: Icon(Icons.search),
  //   label: '探す',
  // ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: 'お気に入り',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'カート',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.account_circle),
    label: 'アカウント',
  ),
];

class EcAppHomePage extends HookConsumerWidget {
  const EcAppHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationIndex = useState(0);

    return Scaffold(
      backgroundColor: const Color(0xFFDEDDD3),
      appBar: AppBar(
        title: Text(_appBarTitle[navigationIndex.value]),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF7939),
      ),
      body: _pageList[navigationIndex.value],
      bottomNavigationBar: BottomNavigationBar(
          items: _bottomNavigationBarItem,
          currentIndex: navigationIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFFFF7939),
          onTap: (index) {
            navigationIndex.value = index;
          }),
    );
  }
}
