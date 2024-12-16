import '../../../../core.dart';
import 'package:dependencies/dependencies.dart';

double systemTransactionAmount = 0.000005;

int solToLamports(double sol) => (1000000000 * sol).toInt();

double lamportsToSol(int lamports) => lamports / 1000000000;

int getTxAmount(Meta? meta) => (meta?.preBalances[0] ?? 0) - (meta?.postBalances[0] ?? 0);

final solanaProgramId = Ed25519HDPublicKey.fromBase58(Defines.solanaProgramId);

const accountNotFound = 'Account not found';

class SolanaService with RpcExceptionHandler {
  final SolanaClient solana;

  SolanaService({required this.solana});

  Future<(Failure?, String?)> sendRequest({
    required Object id,
    String? auxId,
    required String privateKey,
    required String method,
    required List<int> args,
  }) async {
    final keyPair = await Ed25519HDKeyPair.fromMnemonic(privateKey);
    final (pdaErr, pda) = await _generatePDA(id: id, payer: keyPair.publicKey);
    if (pdaErr != null) return (pdaErr, null);

    Ed25519HDPublicKey? auxAccountPDA;
    if (auxId != null) {
      final result = await _generatePDA(id: auxId, payer: keyPair.publicKey);
      if (result.$1 != null) return (result.$1, null);
      auxAccountPDA = result.$2!;
    }

    final instruction = await _prepareInstruction(
      args: args,
      method: method,
      accountPDA: pda!,
      payer: keyPair.publicKey,
      auxAccountPDA: auxAccountPDA,
    );

    if (instruction.$1 != null) return (instruction.$1, null);

    final signature = await _sendAndConfirmTransaction(
      instruction: instruction.$2!,
      signers: [keyPair],
    );

    if (signature.$1 != null) return (signature.$1, null);

    return (null, signature.$2);
  }

  Future<(Failure?, Ed25519HDPublicKey?)> _generatePDA({
    required Object id,
    required Ed25519HDPublicKey payer,
  }) async {
    final seedId = id is String ? Buffer.fromString(id) : Buffer.fromInt64(id as int);
    return await handle<Ed25519HDPublicKey>(Ed25519HDPublicKey.findProgramAddress(
      seeds: [seedId, payer.bytes],
      programId: solanaProgramId,
    ));
  }

  Future<(Failure?, AnchorInstruction?)> _prepareInstruction({
    required String method,
    required List<int> args,
    required Ed25519HDPublicKey accountPDA,
    required Ed25519HDPublicKey payer,
    Ed25519HDPublicKey? auxAccountPDA,
  }) async {
    return await handle<AnchorInstruction>(
      AnchorInstruction.forMethod(
        programId: solanaProgramId,
        method: method,
        arguments: ByteArray(args),
        namespace: SolanaInstructionNamespace.global.name,
        accounts: <AccountMeta>[
          AccountMeta.writeable(pubKey: accountPDA, isSigner: false),
          if (auxAccountPDA != null) AccountMeta.writeable(pubKey: auxAccountPDA, isSigner: false),
          AccountMeta.writeable(pubKey: payer, isSigner: true),
          AccountMeta.writeable(pubKey: Ed25519HDPublicKey.fromBase58(SystemProgram.programId), isSigner: false),
        ],
      ),
    );
  }

  Future<(Failure?, String?)> _sendAndConfirmTransaction({
    required AnchorInstruction instruction,
    required List<Ed25519HDKeyPair> signers,
  }) async {
    return await handle<String?>(solana.sendAndConfirmTransaction(
      signers: signers,
      message: Message(instructions: [instruction]),
      commitment: Commitment.confirmed,
    ));
  }

  Future<(Failure?, String?)> sendSol({
    required Ed25519HDKeyPair source,
    required Ed25519HDPublicKey destination,
    required int lamports,
    String? memo,
  }) async {
    return await handle<String?>(
      solana.transferLamports(
        source: source,
        destination: destination,
        lamports: lamports,
        memo: memo,
        commitment: Commitment.confirmed,
      ),
    );
  }

  Future<(Failure?, List<TransactionSignatureInformation>?)> getSignaturesForAddress({
    required String pubKey,
    int? limit,
    String? before,
  }) async {
    return await handle<List<TransactionSignatureInformation>>(
      solana.rpcClient.getSignaturesForAddress(
        pubKey, limit: limit, before: before,
      ),
    );
  }

  Future<(Failure?, TransactionDetails?)> getTransactionDetails(
    String signature,
  ) async {
    return await handle<TransactionDetails?>(
      solana.rpcClient.getTransaction(signature),
    );
  }

  Future<(Failure?, Iterable<TransactionDetails>?)> getTransactionsDetails({
    required String pubKey,
    int? limit,
    String? before,
  }) async {
    return await handle<Iterable<TransactionDetails>?>(
      solana.rpcClient.getTransactionsList(
        Ed25519HDPublicKey.fromBase58(pubKey),
        limit: limit!,
        before: before,
        commitment: Commitment.finalized,
      ),
    );
  }

  Future<(Failure?, Iterable<TransactionDetails>?)> getMultipleTransactions({
    required List<TransactionSignatureInformation> signatures,
  }) async {
    return await handle<Iterable<TransactionDetails>?>(
      solana.rpcClient.getMultipleTransactions(
        signatures,
        commitment: Commitment.finalized,
      ),
    );
  }

  (bool, bool) _txCountFilterPredicate(TransactionDetails details, String pubKey) {
    final message = (details.transaction as ParsedTransaction).message;
    final isSystemTransaction = lamportsToSol(getTxAmount(details.meta!)) == systemTransactionAmount;
    final isCurrentUser = message.accountKeys[0].pubkey == pubKey;

    return (isSystemTransaction, isCurrentUser);
  }

  Future<(Failure?, ({int total, int received, int sent})?)> getTransactionCount({
    required List<TransactionSignatureInformation> signatures,
    required String pubKey,
  }) async {
    final result = await handle<Iterable<TransactionDetails>?>(
      solana.rpcClient.getMultipleTransactions(signatures, commitment: Commitment.finalized),
    );

    if (result.$1 != null) return (result.$1, null);

    final total = result.$2!.length;
    final received = result.$2!.where((e) => !_txCountFilterPredicate(e, pubKey).$1 && !_txCountFilterPredicate(e, pubKey).$2).length;
    final sent = result.$2!.where((e) => !_txCountFilterPredicate(e, pubKey).$1 && _txCountFilterPredicate(e, pubKey).$2).length;

    return (null, (total: total, received: received, sent: sent));
  }
}