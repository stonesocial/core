import '../../../core.dart';
import 'package:dependencies/dependencies.dart';

const creditException = 'Transaction simulation failed: Attempt to debit an account but found no record of a prior credit.';
const programError0x0 = 'Transaction simulation failed: Error processing Instruction 0: custom program error: 0x0';
const blockchain0x0Error = 'Blockchain error! Check network or if account is already set up';

extension JsonRpcExceptionExtension on JsonRpcException {
  String get formattedMessage {
    if (message == programError0x0) {
      return blockchain0x0Error;
    }

    return message;
  }
}

/// [RpcClientException]
abstract class RpcClientException extends BasisException {
  const RpcClientException(super.exception);

  String get formattedMessage => formatMessage(exception.toString());
}
