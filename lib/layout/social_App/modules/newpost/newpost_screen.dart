import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/widget/widget.dart';

class NewpostScreen extends StatelessWidget {
  const NewpostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, 'Add Post',[]),
    );
  }
}