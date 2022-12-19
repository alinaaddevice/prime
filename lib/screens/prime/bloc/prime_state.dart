part of 'prime_bloc.dart';

@immutable
abstract class PrimeState extends Equatable {}

class PrimeInitial extends PrimeState {
  @override
  List<Object?> get props => [];
}

class PrimeLoading extends PrimeState {
  @override
  List<Object?> get props => [];
}

class PrimeLoaded extends PrimeState {
  PrimeLoaded({required this.items});
  final List<PrimeResult> items;
  @override
  List<Object?> get props => [items];
}

class PrimeLoadedError extends PrimeLoaded {
  PrimeLoadedError({required super.items, required this.error});

  final String error;
}
