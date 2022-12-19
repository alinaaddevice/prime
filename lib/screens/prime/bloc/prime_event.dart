part of 'prime_bloc.dart';

@immutable
abstract class PrimeEvent {}

class PrimeCheckTapEvent extends PrimeEvent {
  PrimeCheckTapEvent({required this.numbers});
  final List<String> numbers;
}

class OnInitStateEvent extends PrimeEvent {
  OnInitStateEvent();
}
