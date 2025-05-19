import 'package:flutter/material.dart';
import 'package:readmore_expandable_text/readmore_expandable_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read More Expandable Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read More Expandable Text Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Usage:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ReadMoreExpandableText(
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                  'nisi ut aliquip ex ea commodo consequat.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Customized Style:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ReadMoreExpandableText(
              text:
                  'This is a customized example with different text and button styles. '
                  'The text is green and the button is red. The icons are also customized '
                  'to use plus and minus symbols instead of the default arrows.',
              maxLines: 2,
              textStyle: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
              buttonStyle: const TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              expandText: 'Show More',
              collapseText: 'Show Less',
              expandIcon: Icons.add,
              collapseIcon: Icons.remove,
              iconColor: Colors.red,
              iconSize: 20,
            ),
            const SizedBox(height: 24),
            const Text(
              'With Custom Padding:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ReadMoreExpandableText(
              text:
                  'This example shows how to customize the padding around the expand/collapse button. '
                  'The button has more padding on all sides for better touch targets.',
              buttonPadding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            ),
            const SizedBox(height: 24),
            const Text(
              'Long Text Example:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ReadMoreExpandableText(
              text:
                  'This is a very long text that will definitely need to be expanded. '
                  'It contains multiple paragraphs and demonstrates how the widget handles '
                  'large amounts of text. The text will be truncated after 3 lines by default '
                  'and can be expanded to show the full content. This is useful for displaying '
                  'long articles, descriptions, or any content that might be too long to show '
                  'all at once. Users can choose to read more if they are interested in the '
                  'full content, making the interface cleaner and more user-friendly.',
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
