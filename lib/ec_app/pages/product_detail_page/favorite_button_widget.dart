// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:murasame_playground/ec_app/providers/providers.dart';
import 'package:murasame_playground/ec_app/utils/utils.dart';

class FavoriteButtonWidget extends HookConsumerWidget {
  const FavoriteButtonWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final int productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(favoriteStateProvider).when(
        data: (favoriteList) {
          final isSelected = useState(
              favoriteList.any((favorite) => favorite.id == productId));

          return IconButton(
            icon: isSelected.value
                ? const Icon(
                    Icons.favorite,
                    size: 32,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                    size: 32,
                  ),
            color: const Color(0xFFFF7A72),
            onPressed: () async {
              isSelected.value = !isSelected.value;
              isSelected.value
                  ? await ref
                      .read(favoriteStateProvider.notifier)
                      .addFavorite(productId: productId)
                      .then((value) => showSnackbar(
                            context: context,
                            message: 'お気に入りに追加しました',
                          ))
                  : await ref
                      .read(favoriteStateProvider.notifier)
                      .removeFavorite(productId: productId)
                      .then((value) => showSnackbar(
                            context: context,
                            message: 'お気に入りから削除しました',
                          ));
            },
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (e, s) {
          return Text(e.toString());
        });
  }
}
