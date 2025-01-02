import 'package:vendor_app/constants/app_constants.dart';
import 'package:vendor_app/http/base_api.dart';
import 'package:vendor_app/http/client/app_client.dart';
import 'package:vendor_app/http/client/default_client.dart';
import 'package:vendor_app/models/base_model.dart';

abstract class BaseAppApi<T extends BaseModel> extends BaseApi<T> {
  @override
  DefaultClient defaultClient() {
    return AppClient(AppConstants.appUrl);
  }
}
