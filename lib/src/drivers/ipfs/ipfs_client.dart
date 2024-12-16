import 'dart:async';
import 'dart:io';

import '../../../core.dart';
import 'package:dependencies/dependencies.dart';

class IpfsClient extends ClientEitherResponseHandler {
  BasisHttpClient httpClient;

  IpfsClient({
    required this.httpClient,
  });

  Future<(Failure?, dynamic)> get({
    required String cid,
  }) async {
    final result = await handleClientEitherResponse(
      (httpClient..urlBase = Defines.ipfsGateway).GET(
        cid, isCustomHeaders: true,
      ),
    );

    if (result.$2 != null) {
      return (null, result.$2!);
    }

    return (result.$1, null);
  }

  Future<(Failure?, IpfsResponse?)> upload({
    required File file,
    Map<String, dynamic>? metadata,
    String? group,
  }) async {
    final name = '${file.hashCode}_${file.path.split('/').last}';

    final result = await handleClientEitherResponse<Map<String, dynamic>>(
      (httpClient..urlBase = Defines.apiUrl).FORM_DATA_POST(
        'index/ipfs/upload',
        files: { 'file': file.path },
        body: { 'Key': name, 'ContentType': 'text' },
      ),
    );

    if (result.$2 != null) {
      final response = IpfsResponse(
        cid: result.$2!.data['cid'],
        createdAt: result.$2!.data['createdAt'],
      );

      return (null, response);
    }

    return (result.$1, null);
  }
}