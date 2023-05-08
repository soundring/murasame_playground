// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/ec_app/pages/product_page/rating_bar_widget.dart';
import 'package:murasame_playground/ec_app/providers/providers.dart';
import 'product_detail_page/cart_button_widget.dart';
import 'product_detail_page/favorite_button_widget.dart';

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productStateProvider).asData?.value ?? [];

    if (productList.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final product = productList[int.parse(productId)];

    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFDEDDD3),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFFFF7939),
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: const Color(0xFFF4F4F0),
              child: Column(
                children: [
                  SizedBox(
                    width: isTablet ? screenWidth * 0.5 : screenWidth,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image(
                        image: AssetImage(product.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            FavoriteButtonWidget(productId: product.id),
                          ],
                        ),
                        const Gap(10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(product.description),
                        ),
                        const Gap(20),
                        Row(
                          children: [
                            RatingBarWidget(
                              product: product,
                              itemSize: 26,
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.messenger,
                                  color: Color(0xffAEAB92),
                                ),
                                Text(
                                  '${product.reviewCount}件',
                                )
                              ],
                            ),
                          ],
                        ),
                        const Gap(30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${product.price}円(税込)',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CartButtonWidget(productId: product.id),
          ),
          // TODO レビュー一覧を表示する
        ],
      ),
    );
  }
}
