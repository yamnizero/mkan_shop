import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/logic/controllers/cart_controller.dart';
import 'package:mkan_shop/logic/controllers/product_controller.dart';
import 'package:mkan_shop/model/product_models.dart';
import 'package:mkan_shop/utils/theme.dart';
import 'package:mkan_shop/view/screens/product_details.dart';
import 'package:mkan_shop/view/widgets/text_utils.dart';

class CardItems extends StatelessWidget {
   CardItems({Key? key}) : super(key: key);

   final controller = Get.find<ProductController>();
   final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      if(controller.isLoading.value){
        return  Center(
          child: CircularProgressIndicator(color: Get.isDarkMode ? pinkClr :mainColor,),
        );
      }else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return builderCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate,
                productId: controller.productList[index].id,
                productModels: controller.productList[index],
                onTap: (){
                  Get.to(()=>ProductDetailsScreen(productModels: controller.productList[index],));
                }
              );
            },
          ),
        );
      }
    });
  }

  Widget builderCardItems( {
  required String image,
  required double price,
  required double  rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white
          ),
          child: Column(
            children: [
              Obx(() =>Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavourites(productId);
                        },
                        icon: controller.isFavourites(productId)
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                            : const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModels);
                        },
                        icon: const  Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      '\$ $price',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: '$rate',
                              color: Colors.white,
                              underline: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
