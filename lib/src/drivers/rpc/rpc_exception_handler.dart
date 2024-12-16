import 'dart:async';
import '../../../core.dart';
import 'package:dependencies/dependencies.dart';

mixin class RpcExceptionHandler {
  Future<(Failure?, T?)> handle<T>(
     Future<T> call, {
        bool downloadFile = false,
        String? fileExtension,
        Function(Object)? onCatch,
        Function()? onTry,
        Function()? onFinally,
      }
  ) async {
    try {
      if (onTry != null) onTry();

      return (null, (await call)  as T?);
    } on BasisClientException catch (e) {
      return (ServerFailure(message: e.formattedMessage, code: e.statusCode), null);
    } on BasisSocketException catch (e) {
      return (CommonFailure(message: e.formattedMessage), null);
    } on JsonRpcException catch (e, _) {
      return (ServerFailure(message: formatMessage(e.formattedMessage)), null);
    } on TimeoutException catch (e) {
      return (CommonFailure(message: formatMessage(e.toString())), null);
    } catch (e) {
      if (onCatch != null) onCatch(e);

      return (CommonFailure(message: formatMessage(e.toString())), null);
    } finally {
      if (onFinally != null) onFinally();
    }
  }
}