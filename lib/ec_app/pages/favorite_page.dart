// Flutter imports:
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:murasame_playground/ec_app/utils/utils.dart';
import 'package:murasame_playground/ec_app/providers/providers.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    final favoriteProductList =
        ref.watch(favoriteListProvider).asData?.value ?? [];

    if (favoriteProductList.isEmpty) {
      return const Center(
        child: Text('お気に入り商品がありません'),
      );
    }

    return Center(
        child: ListView.builder(
      itemCount: favoriteProductList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: const Color(0xFFF4F4F0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.5,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        favoriteProductList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        favoriteProductList[index].name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${favoriteProductList[index].price}円(税込)',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(18),
                      ElevatedButton(
                        onPressed: () async {
                          ref
                              .read(favoriteListProvider.notifier)
                              .removeFavorite(
                                  productId: favoriteProductList[index].id)
                              .then((value) => showSnackbar(
                                  context: context, message: 'お気に入りから削除しました'));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7A72),
                        ),
                        child: const Text('お気に入りから削除'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
}
