import '../base_fixture.dart';

class AppTokenSuccessFixture extends BaseFixture {
  @override
  Map<String, dynamic>? get data {
    return {
      'access_token': 'Fc_vIx5Ndg13x-NKstYTd6rvujW24hWG3ofV-SsgZUY',
      'token_type': 'Bearer',
      'expires_in': 7200,
      'created_at': 1666237585
    };
  }

  @override
  int? get statusCode => 200;
}
