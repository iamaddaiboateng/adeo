import 'package:flutter/material.dart';

class AnanseWidget extends StatelessWidget {
  const AnanseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      child: Column(
        children: const [
          Text("Text"),
          Text("Lorem Things"),
        ],
      ),
    );
  }
}
