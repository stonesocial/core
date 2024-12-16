import 'package:dependencies/dependencies.dart';

import '../../../core.dart';

const errorWritingCacheData = 'Error writing cache data';
const errorReadingCacheData = 'Error reading cache data';
const noCacheData = 'There is no cache data';

class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage storage;

  const SecureStorage(this.storage);

  @override
  Future<(Failure?, bool)> write(String key, String value) async {
    try {
      await storage.write(key: key, value: value);

      return (null, true);
    } catch (_) {
      return (const CacheFailure(message: errorWritingCacheData), false);
    }
  }

  @override
  Future<(Failure?, T?)> read<T>(String key) async {
    try {
      final result = await storage.read(key: key);

      return (null, result as T);
    } catch (_) {
      return (const CacheFailure(message: errorReadingCacheData), null);
    }
  }

  @override
  Future<(Failure?, bool)> delete(String key) async {
    try {
      final hasData = await read(key);

      if (hasData.$2 != null) {
        await storage.delete(key: key);

        return (null, true);
      }

      return (const CacheFailure(message: noCacheData), false);
    } catch (_) {
      return (const CacheFailure(message: errorReadingCacheData), false);
    }
  }
}