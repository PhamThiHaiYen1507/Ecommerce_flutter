import 'package:nws_yenpth1_ecommerce_flutter/base/base.dart';
import 'package:nws_yenpth1_ecommerce_flutter/models/category_data.dart';
import 'package:nws_yenpth1_ecommerce_flutter/providers/api_path.dart';

class CategoryProvider extends BaseNetWork {
  Future<List<CategoryData>> getAllCategory() async {
    final ApiRequest req = ApiRequest(
      path: ApiPath.categories,
      method: METHOD.GET,
      auth: false,
    );

    final res = await sendRequest(
      req,
      decoder: CategoryData.fromJson,
    );

    if (res.success) {
      return res.items;
    } else {
      return [];
    }
  }
}
