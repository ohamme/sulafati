import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'features/salafiya/providers/salafiya_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => SalafiyaProvider())],
      child: const SulafatiApp(),
    ),
  );
}
