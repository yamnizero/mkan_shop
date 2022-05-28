import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/product_controller.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;


  ClothesInfo(
      {required this.title,
      required this.productId,
      required this.rate,
      required this.description,
      Key? key})
      : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? Colors.white.withOpacity(0.9)
                      : Colors.grey.withOpacity(0.4),
                  shape: BoxShape.circle),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.manageFavourites(productId);
                  },
                  child: controller.isFavourites(productId)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                          size: 20,
                        ),
                ),
              ),
            ),
          ]),
          Row(
            children: [
              TextUtils(
                text: "$rate",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                underline: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBarIndicator(
                rating: rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 30.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr :mainColor,
            ),
            moreStyle:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr :mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
// RatingBar(
//   rating: rate,
//   icon: const Icon(
//     Icons.star,
//     size: 20,
//     color: Colors.grey,
//   ),
//   starCount: 5,
//   spacing: 1,
//   size: 20,
//   isIndicator: false,
//   allowHalfRating: true,
//   onRatingCallback: (value, ValueNotifier<bool> isIndicator) {
//     isIndicator.value = true;
//   },
//   color: Colors.orangeAccent,
// )