// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acessToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return new AccessToken(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: json['expires_in'],
      scope: json['scope'] as String);
}

abstract class _$AccessTokenSerializerMixin {
  String get accessToken;
  String get tokenType;
  String get refreshToken;
  dynamic get expiresIn;
  String get scope;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'access_token': accessToken,
        'token_type': tokenType,
        'refresh_token': refreshToken,
        'expires_in': expiresIn,
        'scope': scope
      };
}
