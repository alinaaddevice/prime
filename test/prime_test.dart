// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:prime/screens/prime/repository/int_extension.dart';
import 'package:prime/screens/prime/repository/prime_repository.dart';
import 'package:collection/collection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('First 50 prime test', () async {
    final primes = [
      2,
      3,
      5,
      7,
      11,
      13,
      17,
      19,
      23,
      29,
      31,
      37,
      41,
      43,
      47,
    ].map((e) => e.toBigInt).toList();
    final primeDetector = PrimeSquareRepository();
    final List<BigInt> firstFiftyPrimes = <BigInt>[];
    final end = 50.toBigInt;
    for (BigInt i = 0.toBigInt; i < end; i += 1.toBigInt) {
      final isPrime = primeDetector.isPrime(i);
      if (isPrime) {
        firstFiftyPrimes.add(i);
      }
    }
    Function eq = const ListEquality().equals;
    expect(eq(primes, firstFiftyPrimes), true);
  });
}
