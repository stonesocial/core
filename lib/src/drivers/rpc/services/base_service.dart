import 'package:dependencies/dependencies.dart';
import 'package:web3dart/web3dart.dart';

import '../enums.dart';
import '../rpc_exception_handler.dart';

int ethToWei(double eth) => (1000000000000000000 * eth).toInt();

class BlockchainService with RpcExceptionHandler {
  final Web3Client client;

  BlockchainService(this.client);

  Future<(Failure?, EtherAmount?)> getBalance(String address) async {
    EthereumAddress ethAddress = EthereumAddress.fromHex(address);

    return await handle<EtherAmount?>(client.getBalance(ethAddress));
  }

  Future<(Failure?, String?)> sendEth({
    required String priKey,
    required String destination,
    required double amount,
  }) async {
    return await handle<String?>(
      client.sendTransaction(
        EthPrivateKey.fromHex(priKey),
        Transaction(
          to: EthereumAddress.fromHex(destination),
          value: EtherAmount.fromInt(EtherUnit.wei, ethToWei(amount)),
        ),
        chainId: EthereumSubLayerCode.baseOptimismArbitrum.value,
      ),
    );
  }

  Future<(Failure?, List<FilterEvent>?)> getLogs({
    required String pubKey,
    int? limit,
    String? before,
  }) async {
    return await handle<List<FilterEvent>?>(
      client.getLogs(FilterOptions(address: EthereumAddress.fromHex(pubKey))),
    );
  }

  void dispose() => client.dispose();
}
