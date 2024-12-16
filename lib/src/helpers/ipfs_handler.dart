import 'dart:io';

import 'package:dependencies/dependencies.dart';

import '../../core.dart';

final _ipfsClient = locator.get<IpfsClient>();

class IpfsHandler {
  static Future<(Failure?, String?)> upload(File file) async {
    final result = await _ipfsClient.upload(file: file);
    if (result.$1 != null) return (result.$1, null);

    return (null, '${Defines.ipfsGateway}/${result.$2!.cid}');
  }
}
