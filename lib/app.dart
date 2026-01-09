import 'package:flutter/material.dart';
import 'features/status/presentation/pages/status_page.dart';

class WhatsAppStatusDownloaderApp extends StatelessWidget {
  const WhatsAppStatusDownloaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مو تحميل',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const StatusPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
