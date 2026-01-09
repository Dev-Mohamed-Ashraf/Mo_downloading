import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حول التطبيق'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/1.jpg'),
                  backgroundColor: Colors.green,
                ),
                const SizedBox(height: 16),
                const Text('مو تحميل', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 8),
                const Text('تطبيق تحميل حالات واتساب (صور وفيديو) بسهولة وحفظها مباشرة في الاستوديو.',
                    style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 12),
                const Text(': المطور', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF1565C0))),
                const SizedBox(height: 4),
                const Text('محمد أشرف فتحي ابراهيم العدوي', style: TextStyle(fontSize: 18, color: Colors.black87)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.blueAccent),
                      tooltip: 'LinkedIn',
                      onPressed: () => _launchUrl(context, 'https://www.linkedin.com/in/mohamedashraffff/'),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.github, color: Colors.black),
                      tooltip: 'GitHub',
                      onPressed: () => _launchUrl(context, 'https://github.com/mohamedashraffathyoffical'),
                    ),
                    IconButton(
                      icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                      tooltip: 'Facebook',
                      onPressed: () => _launchUrl(context, 'https://www.facebook.com/profile.php?id=100087803096417'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تعذر فتح الرابط في المتصفح.')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح الرابط في المتصفح.')),
        );
      }
    }
  }
}
