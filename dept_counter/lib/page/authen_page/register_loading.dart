import 'package:flutter/material.dart';

class RegisterLoading extends StatefulWidget {
  @override
  _RegisterLoadingState createState() => _RegisterLoadingState();
}

class _RegisterLoadingState extends State<RegisterLoading>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            value: controller.value,
            // semanticsLabel: 'Linear progress indicator',
          ),
        ),
      ),
    );
  }
}
