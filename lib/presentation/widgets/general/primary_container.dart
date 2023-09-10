import 'package:flutter/material.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({ 
    super.key,
    this.child,
    this.padding,
    this.borderRadius
  });

  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        color: Colors.white
      ),
      padding: padding ?? EdgeInsets.all(15),
      
      child: child,
    );
  }
}