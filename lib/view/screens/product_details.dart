import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkan_shop/model/product_models.dart';

import '../widgets/productsDetails/Ccothes_Info.dart';
import '../widgets/productsDetails/image_sliders.dart';
import '../widgets/productsDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({
    required this.productModels,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl: productModels.image),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              // AddCart(),

            ],
          ),
        ),
      ),
    );
  }
}
