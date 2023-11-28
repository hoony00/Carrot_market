
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFragment extends ConsumerStatefulWidget {
  const MyFragment({super.key});

  @override
  ConsumerState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<MyFragment> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
