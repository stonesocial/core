import 'package:dependencies/dependencies.dart';

part 'ipfs_response.freezed.dart';

part 'ipfs_response.g.dart';

@freezed
class IpfsResponse with _$IpfsResponse {
  const factory IpfsResponse({
    required String cid,
    String? createdAt,
    String? updatedAt,
    Map<String, dynamic>? meta,
  }) = _IpfsResponse;

  const IpfsResponse._();

  factory IpfsResponse.fromJson(Map<String, dynamic> json) => _$IpfsResponseFromJson(json);
}