import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:prime/screens/prime/repository/prime_efficient_repository.dart';
import 'package:collection/collection.dart' show IterableExtension;

import 'prime_result.dart';

part 'prime_event.dart';
part 'prime_state.dart';

class PrimeBloc extends Bloc<PrimeEvent, PrimeState> {
  final PrimeEfficientRepository primeRepository;

  PrimeBloc({required this.primeRepository}) : super(PrimeInitial()) {
    on<PrimeCheckTapEvent>(_onPrimeLoadEvent);
    on<OnInitStateEvent>(_onInitState);
  }

  Future<void> _onInitState(
      OnInitStateEvent loadEvent, Emitter<PrimeState> emitter) async {
    emitter(PrimeLoaded(
        items:
            [0, 1, 2].map((e) => PrimeResult(id: '$e', number: '')).toList()));
  }

  Future<void> _onPrimeLoadEvent(
      PrimeCheckTapEvent loadEvent, Emitter<PrimeState> emitter) async {
    final numberStrings = loadEvent.numbers;
    List<BigInt> numbers = [];
    // Validate
    try {
      numbers = _tryToLoadPrimes(numberStrings);
    } catch (e) {
      var error = 'Unknown error';
      if (e is ErrorDescription) {
        error = e.toString();
      }
      final items = numberStrings
          .mapIndexed((index, e) => PrimeResult(id: '$index', number: e))
          .toList();
      emitter(PrimeLoadedError(items: items, error: error));
      return;
    }
    emitter(PrimeLoading());

    final results = await primeRepository.isPrime(numbers);
    final result = numbers
        .mapIndexed((index, element) => PrimeResult(
            id: '$index',
            isPrime: results[index],
            number: numberStrings[index]))
        .toList();
    emitter(PrimeLoaded(items: result));
  }

  List<BigInt> _tryToLoadPrimes(List<String> primes) {
    final nonNumeric = primes.firstWhereOrNull((element) => !element.isNumeric);
    if (nonNumeric != null) {
      throw ErrorDescription("Non numeric input");
    }

    final is64BitNumber =
        primes.firstWhereOrNull((element) => !element.is64BitNumber);
    if (is64BitNumber != null) {
      throw ErrorDescription("The input not 64 bit long integer");
    }

    return primes.map((e) => BigInt.parse(e)).toList();
  }
}

extension _StringAddition on String {
  /// Maximum 64 bit integer
  BigInt get max64 => BigInt.parse("9223372036854775807");

  /// Minimum 64 bit number
  BigInt get min64 => BigInt.parse("-9223372036854775808");

  bool get isNumeric {
    final b = RegExp(r'^[0-9]+$').hasMatch(this);
    return b;
  }

  bool get is64BitNumber =>
      BigInt.parse(this) <= max64 && BigInt.parse(this) >= min64;
}
