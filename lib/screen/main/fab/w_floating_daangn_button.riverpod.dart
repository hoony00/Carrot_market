import 'package:flutter_riverpod/flutter_riverpod.dart';

final isExpanded = false;
final isSmall = false;

final floatingButtonIsExpandedProvider = StateProvider((ref) => false);
final floatingButtonIsSmallProvider = StateProvider((ref) => false);