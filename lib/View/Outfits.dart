import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Outfits extends StatefulWidget {
  const Outfits({Key? key}) : super(key: key);

  @override
  State<Outfits> createState() => _OutfitsState();
}

class _OutfitsState extends State<Outfits> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Outfits'),
    );
  }
}
