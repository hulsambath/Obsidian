import 'package:cm_vendor_app/constants/api_constants.dart';
import 'package:cm_vendor_app/core/http/apis/base_api.dart';
import 'package:cm_vendor_app/core/http/clients/app_client.dart';
import 'package:cm_vendor_app/core/http/clients/default_client.dart';
import 'package:cm_vendor_app/core/models/base_model.dart';

abstract class BaseAppApi<T extends BaseModel> extends BaseApi<T> {
  @override
  DefaultClient buildClient() {
    return AppClient(ApiConstant.apiUrl);
  }
}
