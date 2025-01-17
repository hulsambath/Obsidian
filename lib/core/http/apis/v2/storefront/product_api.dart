import 'package:cm_vendor_app/core/http/apis/base_app_api.dart';
import 'package:cm_vendor_app/core/models/product_model.dart';

class ProductsApi extends BaseAppApi<ProductModel> {
  @override
  String get path => '/api/v2/storefront/products';

  @override
  ProductModel? jsonToObject(Map<String, dynamic> json) {
    return ProductModel.fromJson(json);
  }
}
