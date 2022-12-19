import 'package:prime/screens/prime/repository/int_extension.dart';

abstract class PrimeRepository {
  /// Check if n is prime
  bool isPrime(BigInt n);
}

class PrimeSquareRepository extends PrimeRepository {
  @override

  /// This algorithm checks until `n.sqrt()` since after it doesn't make sense to check
  bool isPrime(BigInt n) {
    if (n <= 1.toBigInt) {
      return false;
    }

    for (BigInt i = 2.toBigInt; i <= n.sqrt(); i += 1.toBigInt) {
      if (n % i == 0.toBigInt) {
        return false;
      }
    }

    return true;
  }
}
