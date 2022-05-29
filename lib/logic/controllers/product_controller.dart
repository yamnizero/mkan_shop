
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mkan_shop/model/product_models.dart';
import 'package:mkan_shop/services/product_services.dart';

class ProductController extends GetxController {

  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var favStorage = GetStorage();

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

@override
  void onInit() {
    super.onInit();

    List? storageShop = favStorage.read<List>("isFavouritesList");
    if(storageShop != null){
        favouritesList = storageShop.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }
 void getProducts() async {

   var products = await ProductServices.getProduct();
   try {
     isLoading(true);
     if(products.isNotEmpty){
       productList.addAll(products);
     }
   }  finally {
     isLoading(false);
   }
  }


  void manageFavourites(int productId) async {
  var existingIndex = favouritesList.indexWhere((element) => element.id == productId);

  if(existingIndex >= 0) {
    favouritesList.removeAt(existingIndex);
    await favStorage.remove("isFavouritesList");
  }else{
    favouritesList.add( productList.firstWhere((element) => element.id == productId));
    await favStorage.write("isFavouritesList", favouritesList);
  }

  }

  bool isFavourites(int productId){
    return favouritesList.any((element) => element.id == productId);
  }


  //search Bar Logic
  void addSearchToLis(String searchName){

  searchName = searchName.toLowerCase();

  searchList.value = productList.where((search)  {
    var searchTitle =search.title.toUpperCase();
    var searchPrice = search.price.toString().toLowerCase();

    return searchTitle.contains(searchName) || searchPrice.toString().contains(searchName);
  })
      .toList();

  update();
  }

  void clearSearch(){
  searchTextController.clear();
  addSearchToLis("");
  }


}

