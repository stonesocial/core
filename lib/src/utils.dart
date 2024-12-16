import 'dart:math';

int i64() {
  final random = Random.secure();
  final int part1 = random.nextInt(1 << 32);
  final int part2 = random.nextInt(1 << 32);

  // Combine the two 32-bit parts into a 64-bit integer and ensure it's unsigned
  final BigInt result = (BigInt.from(part1) << 32 | BigInt.from(part2)) & BigInt.parse('0xFFFFFFFFFFFFFFFF');


  return result.toInt();
}
