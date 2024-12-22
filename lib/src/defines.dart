abstract class Defines {
  static const apiUrl = String.fromEnvironment('API_URL');
  static const ipfsGateway = String.fromEnvironment('IPFS_GATEWAY_URL');
  static const rpcUrl = String.fromEnvironment('QUICKNODE_RPC_URL');
  static const websocketUrl = String.fromEnvironment('QUICKNODE_RPC_WSS');
  static const solanaProgramId = String.fromEnvironment('SOLANA_PROGRAM_ID');
  static const coingeckoApiUrl = String.fromEnvironment('COINGECKO_API_URL');
  static const metaplexProgramId = String.fromEnvironment('METAPLEX_PROGRAM_ID');
  static const userPlaceholderCid = String.fromEnvironment('USER_PLACEHOLDER_CID');
  static const channelPlaceholderCid = String.fromEnvironment('CHANNEL_PLACEHOLDER_CID');
  static const mnemonicTest = String.fromEnvironment('MNEMONIC_TEST');
  static const userTest = String.fromEnvironment('USER_TEST');
}