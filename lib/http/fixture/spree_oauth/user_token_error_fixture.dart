import '../base_fixture.dart';

class UserTokenErrorFixture extends BaseFixture {
  @override
  Map<String, dynamic>? get data {
    return {
      'error': 'invalid_request',
      'error_description': 'Missing required parameter: grant_type.',
    };
  }

  @override
  int? get statusCode => 400; // Bad request
}
