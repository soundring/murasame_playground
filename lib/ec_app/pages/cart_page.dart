// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/ec_app/providers/providers.dart';

class CartPage extends ConsumerWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cartItemList = ref.watch(cartStateProvider).asData?.value ?? [];

    if (cartItemList.isEmpty) {
      return const Center(
        child: Text('カートに商品がありません'),
      );
    }

    return Center(
      child: ListView.builder(
        itemCount: cartItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      cartItemList[index].product.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemList[index].product.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${cartItemList[index].product.price}円(税込)',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(18),
                    // TODO カートから削除ボタンを追加する
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
