// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/ec_app/providers/providers.dart';
import 'package:murasame_playground/ec_app/utils/utils.dart';

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

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItemList.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: const Color(0xFFF4F4F0),
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
                    const Gap(8),
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
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '数量:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Gap(8),
                            DropdownButton(
                                focusColor: Colors.white,
                                value: cartItemList[index].quantity,
                                items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                    .map((int value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                                onChanged: (int? value) async {
                                  await ref
                                      .read(cartStateProvider.notifier)
                                      .changeCartItemQuantity(
                                          productId:
                                              cartItemList[index].product.id,
                                          quantity: value!);
                                }),
                          ],
                        ),
                        const Gap(8),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF7A72),
                            ),
                            onPressed: () async {
                              await ref
                                  .read(cartStateProvider.notifier)
                                  .removeCartItem(
                                      productId: cartItemList[index].product.id)
                                  .then((value) => showSnackbar(
                                      context: context,
                                      message: 'カートから削除しました'));
                            },
                            child: const Text('カートから削除する')),
                        const Gap(8),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Gap(8),
        const Divider(),
        const Gap(8),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'カートのアイテム ${ref.watch(cartStateProvider.notifier).totalQuantity()} 個',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '合計金額 ${ref.watch(cartStateProvider.notifier).totalPrice()}円(税込)',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Gap(18),
      ],
    );
  }
}
