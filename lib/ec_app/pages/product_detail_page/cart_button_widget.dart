// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/ec_app/providers/providers.dart';
import 'package:murasame_playground/ec_app/utils/utils.dart';

class CartButtonWidget extends ConsumerWidget {
  const CartButtonWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;

    final cartItemList = ref.watch(cartStateProvider).asData?.value ?? [];
    final isCartItem =
        cartItemList.any((cartItem) => cartItem.product.id == productId);
    final buttonText = isCartItem ? 'カートに追加済みです' : 'カートに入れる';

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF532305),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.025,
        ),
      ),
      onPressed: isCartItem
          ? null
          : () async {
              await ref
                  .read(cartStateProvider.notifier)
                  .addCartItem(productId: productId)
                  .then((value) =>
                      showSnackbar(context: context, message: 'カートに追加しました'));
            },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart),
          Text(buttonText),
        ],
      ),
    );
  }
}
