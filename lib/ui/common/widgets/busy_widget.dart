import 'package:flutter/material.dart';

class BusyWidget extends StatelessWidget {
  const BusyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
