import 'package:json_annotation/json_annotation.dart';
part 'acessToken.g.dart';   // associated generated dart file


@JsonSerializable()
class AccessToken {

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'token_type')
  final String tokenType;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'expires_in')
  var expiresIn;
  @JsonKey(name: 'scope')
  final String scope;

  AccessToken(
      {this.accessToken, this.tokenType, this.refreshToken, this.expiresIn, this.scope});


  /*factory AccessToken.fromJson(Map<String,dynamic> json){
    return AccessToken(

      accessToken: json["accessToken"] as String,
      tokenType: json["tokenType"] as String,
      refreshToken: json["refreshToken"] as String,
      expiresIn: json["expiresIn"],
      scope: json["scope"] as String

    );
*/

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  }



