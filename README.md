<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Read More Expandable Text

A Flutter package that provides an expandable text widget with customizable styles and animations.

## Features

- Expandable and collapsible text with customizable max lines
- Customizable text styles for both content and the expand/collapse button
- Customizable expand/collapse icons and colors
- Customizable button text ("See More"/"See Less")
- Automatic detection of text overflow
- Smooth animations

## Visual Preview
![readmore_expandable_text_demo](https://github.com/user-attachments/assets/3dbe0f66-4baa-4aea-a844-2684bc4e145d)


## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  readmore_expandable_text: ^0.0.3
```

## Usage

### Basic Usage

```dart
import 'package:readmore_expandable_text/readmore_expandable_text.dart';

ReadMoreExpandableText(
  text: 'Your long text here...',
)
```

### Customized Usage

```dart
ReadMoreExpandableText(
  text: 'Your long text here...',
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
)
```

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| text | String | required | The text content to display |
| maxLines | int | 3 | Maximum number of lines to show when collapsed |
| textStyle | TextStyle? | null | Style for the text content |
| buttonStyle | TextStyle? | null | Style for the expand/collapse button |
| expandText | String | 'See More' | Text for the expand button |
| collapseText | String | 'See Less' | Text for the collapse button |
| expandIcon | IconData | Icons.keyboard_arrow_down | Icon for the expand button |
| collapseIcon | IconData | Icons.keyboard_arrow_up | Icon for the collapse button |
| iconColor | Color? | Colors.blue | Color for the expand/collapse icons |
| iconSize | double | 17.5 | Size of the expand/collapse icons |
| buttonPadding | EdgeInsets | EdgeInsets.only(top: 12.0) | Padding around the expand/collapse button |

## Example

Check out the [example](example/lib/main.dart) for a complete demonstration of the package's features.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
