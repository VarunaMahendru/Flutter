// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acessToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return new AccessToken(
      accessToken: json['accessToken'] as String,
      tokenType: json['tokenType'] as String,
      refreshToken: json['refreshToken'] as String,
      expiresIn: json['expiresIn'],
      scope: json['scope'] as String);
}

abstract class _$AccessTokenSerializerMixin {
  String get accessToken;
  String get tokenType;
  String get refreshToken;
  dynamic get expiresIn;
  String get scope;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessToken': accessToken,
        'tokenType': tokenType,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
        'scope': scope
      };
}
