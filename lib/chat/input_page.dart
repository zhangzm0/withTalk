import 'package:flutter/material.dart';
import 'input.dart';

/// 输入页：无 AppBar，全屏输入
class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SizedBox.expand(
          child: InputWidget(), // 占满整个可用区域
        ),
      ),
    );
  }
}
