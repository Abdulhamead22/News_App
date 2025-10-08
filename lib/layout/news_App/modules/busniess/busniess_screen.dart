import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';

/*
1- create blocConsumer<appCubit,appState>
2- in the builder of blocConsumer return conditionalBuilder
3- in the builder of conditionalBuilder return ListView.separated
 */
class BusniessScreen extends StatelessWidget {
  const BusniessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return blocBuilder("busniess");
  }
}
