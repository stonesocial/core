import 'package:dependencies/dependencies.dart';

const privateKey = 'private_secret_key';
const accessCodeKey = 'access_code_secret_key';

abstract interface class ISecureStorage {
  Future<(Failure?, bool)> write(String key, String value);
  Future<(Failure?, T?)> read<T>(String key);
  Future<(Failure?, bool)> delete(String key);
}