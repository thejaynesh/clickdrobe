import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Wardrobe extends StatefulWidget {
  const Wardrobe({Key? key}) : super(key: key);

  @override
  State<Wardrobe> createState() => _WardrobeState();
}

class _WardrobeState extends State<Wardrobe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Wardrobe'),
    );
  }
}
