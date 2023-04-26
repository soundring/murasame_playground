// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Project imports:
import 'package:murasame_playground/ec_app/model/model.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget(
      {Key? key, required this.product, required this.itemSize})
      : super(key: key);

  final Product product;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: product.star,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: itemSize,
      ignoreGestures: true,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Color(0xffFFD200),
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
