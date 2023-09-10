import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  const Slide({ 
    required this.image 
  });

  final Image image;

  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: image,
    );
  }
}