import 'package:flutter/material.dart';
import 'input.dart';

/// 输入页：无 AppBar，专为小屏准备
class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: SizedBox()), // 顶部留白，可删
            InputWidget(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
