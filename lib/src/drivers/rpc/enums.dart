enum SolanaInstructionNamespace { global }
enum Blockchain { solana, bsc }
enum SolanaMethod {
  createUser('create_user'),
  updateUser('update_user'),
  deleteUser('delete_user');

  final String value;

  const SolanaMethod(this.value);
}

enum EthereumSubLayerCode {
  baseOptimismArbitrum(42161);

  final int value;

  const EthereumSubLayerCode(this.value);
}
