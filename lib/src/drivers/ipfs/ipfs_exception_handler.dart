import 'dart:async';
import 'dart:convert';

import 'package:dependencies/dependencies.dart';

mixin class IpfsExceptionHandler {
  Future<(Failure?, T?)> handle<T>(
      Future<Response> call, {
        bool downloadFile = false,
        String? fileExtension,
        Function(Object)? onCatch,
        Function()? onTry,
        Function()? onFinally,
      }
  ) async {
    try {
      if (onTry != null) onTry();
      final response = await call;
      final result = jsonDecode(response.body);

      if (result['error'] is Map) {
        return (ServerFailure(message: result['error']['message']), null);
      }

      if (result['message'] is List) {
        return (ServerFailure(message: (result['message'] as List).join(', ')), null);
      }

      if (result['statusCode'] == 401 || result['statusCode'] == 400) {
        return (ServerFailure(message: result['message']), null);
      }

      return (null, result as T?);

    } on BasisClientException catch (e) {
      return (ServerFailure(message: e.formattedMessage, code: e.statusCode), null);
    } on BasisSocketException catch (e) {
      return (CommonFailure(message: e.formattedMessage), null);
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