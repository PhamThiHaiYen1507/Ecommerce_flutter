import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/product_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/product_provider.dart';
import 'package:nws_yenpth1_ecommerce_flutter/screens/Home/controller.dart';
import 'package:nws_yenpth1_ecommerce_flutter/utils/utils.dart';

enum SEARCH_FILTER { NAME, PRICE }

class CategoryDetailController extends GetxController {
  final HomeController homeController = Get.find();
  final int categoryId;
  late final ProductProvider _productProvider;
  late final Rx<List<ProductData>> productList;
  late final RxBool loading;
  late final Rx<SEARCH_FILTER> searchFiller;
  CategoryDetailController(this.categoryId);

  @override
  void onInit() {
    _productProvider = ProductProvider();
    productList = Rx([]);
    loading = RxBool(false);
    searchFiller = Rx(SEARCH_FILTER.NAME);
    getAllProduct();
    super.onInit();
  }

  Future<void> getAllProduct({String? title, String? price}) async {
    loading(true);
    productList.value = await _productProvider.getFilterProduct(
        categoryId: categoryId, title: title, price: price);
    loading(false);
  }

  void onFavourite(BuildContext context, ProductData productData) {
    if (productData.favourite != true) {
      homeController.myFavouties.update((val) {
        val?.add(productData);
      });
      productData.favourite = true;
      update();
      Utils.showNotiBotom(context, NOTIFICATION_TYPE.SUCCESS,
          'Add products to my favorite successfully');
    } else {
      homeController.myFavouties.update((val) {
        val?.remove(productData);
      });
      productData.favourite = false;
      update();
      Utils.showNotiBotom(context, NOTIFICATION_TYPE.SUCCESS,
          'Remove the product from my favorite successfully');
    }
  }
}
