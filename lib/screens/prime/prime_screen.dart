import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prime/screens/prime/bloc/prime_bloc.dart';
import 'package:prime/screens/prime/repository/prime_repository.dart';

import 'repository/prime_efficient_repository.dart';

part 'widgets/_item.dart';
part 'widgets/_empty.dart';
part 'widgets/_check_button.dart';
part 'widgets/_key_value_addition.dart';

class PrimeScreen extends StatefulWidget {
  const PrimeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<PrimeScreen> with _KeyValueMixin {
  late final _bloc = PrimeBloc(
      primeRepository: PrimeEfficientRepositoryConcrete(
          repository: PrimeSquareRepository()));

  @override
  void initState() {
    _bloc.add(OnInitStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (BuildContext context) => _bloc,
            child: BlocListener<PrimeBloc, PrimeState>(
                listener: _onStateChange,
                child: BlocBuilder<PrimeBloc, PrimeState>(
                    builder: (BuildContext context, PrimeState state) {
                  if (state is PrimeLoaded) {
                    return Stack(children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.items
                              .map((e) => _Item(
                                  key: Key('${e.id}_${e.number}_${e.isPrime}'),
                                  title: e.number.toString(),
                                  isPrime: e.isPrime,
                                  controller:
                                      getValue(e.id, TextEditingController())))
                              .toList()),
                      _CheckButton(onTap: _onTapCheckButton)
                    ]);
                  }
                  return _Empty();
                }))));
  }

  void _onTapCheckButton() {
    final numbers = all<TextEditingController>().map((e) => e.text).toList();
    _bloc.add(PrimeCheckTapEvent(numbers: numbers));
  }

  void _onStateChange(BuildContext context, PrimeState state) {
    if (state is PrimeLoadedError) {
      _showDialog(state.error);
    }
  }

  void _showDialog(String error) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(error),
        );
      },
    );
  }
}
