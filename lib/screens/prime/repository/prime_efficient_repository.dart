import 'package:flutter/foundation.dart';

import 'prime_repository.dart';

abstract class PrimeEfficientRepository {
  Future<List<bool>> isPrime(List<BigInt> candidates);
}

class PrimeEfficientRepositoryConcrete extends PrimeEfficientRepository {
  PrimeEfficientRepositoryConcrete({required this.repository});
  final PrimeRepository repository;
  @override
  Future<List<bool>> isPrime(List<BigInt> candidates) async {
    final results = <bool>[];
    for (BigInt candidate in candidates) {
      final value = await compute<_IsolateModel, bool>(
          _heavyTask, _IsolateModel(candidate));
      results.add(value);
    }

    return results;
  }

  bool _heavyTask(_IsolateModel model) {
    return repository.isPrime(model.number);
  }
}

class _IsolateModel {
  _IsolateModel(this.number);

  final BigInt number;
}
