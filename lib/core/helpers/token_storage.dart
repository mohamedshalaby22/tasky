import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _secureStorage = FlutterSecureStorage();
  static const _accessTokenKey = 'accessToken';
  static const _refreshTokenKey = 'refreshToken';

  static Future<void> saveTokens(
      {required String accessToken, required String refreshToken}) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  static Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  static Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  static Future<void> deleteTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }
}
