import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({ 
    required this.amount,
    required this.current
  });

  final int amount;
  final ValueNotifier<int> current;

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          amount, 
          (index) => _Circle(
            index: index, 
            current: current,
            circlesAmount: amount,
          )
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({ 
    required this.index,
    required this.current,
    required this.circlesAmount
  });

  final int index;
  final ValueNotifier<int> current;
  final int circlesAmount;

  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: current,
      builder: (context, value, _) {
        final opacity = (0.3 / circlesAmount) * (circlesAmount - (current.value - index).abs());

        return Row(
          children: [
            index != 0 ? const SizedBox(width: 2.5) : const SizedBox.shrink(),

            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value == index ? 
                  Colors.black :
                  Color.fromRGBO(0, 0, 0, opacity)
              ),
            ),

            index != circlesAmount - 1 ? const SizedBox(width: 2.5) : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}