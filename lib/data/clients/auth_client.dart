import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/core/core.dart';
import '/data/data.dart';

part 'auth_client.g.dart';

@RestApi()

/// Token Üreten Servisler
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  ///
  @POST(AppUrls.register)
  Future<AuthResponse> registerUser(
    @Body() RegisterRequest request,
  );

  ///
  @POST(AppUrls.login)
  Future<AuthResponse> loginUser(
    @Body() LoginRequest request,
  );
}
