part of '../prime_screen.dart';

class _Item extends StatelessWidget {
  final String title;
  final bool? isPrime;
  final TextEditingController? controller;

  const _Item(
      {required this.title, required this.isPrime, this.controller, super.key});
  @override
  Widget build(BuildContext context) {
    final isPrimeLocal = isPrime;
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: 300,
          child: TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter number'))),
      isPrimeLocal == null
          ? const SizedBox.shrink()
          : Text(isPrimeLocal ? 'true' : 'false')
    ]);
  }
}
