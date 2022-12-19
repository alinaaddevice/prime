part of '../prime_screen.dart';

class _CheckButton extends StatelessWidget {
  const _CheckButton({this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: SizedBox(
                      width: 200,
                      height: 40,
                      child: InkWell(
                          onTap: onTap,
                          child: const Center(child: Text('Check')))))
            ]));
  }
}
