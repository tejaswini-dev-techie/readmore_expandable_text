import 'package:flutter/material.dart';

/// A widget that displays text that can be expanded and collapsed.
///
/// The [ReadMoreExpandableText] widget displays text that can be expanded to show more
/// content or collapsed to show less. It provides customization options for
/// text styles, max lines, and expand/collapse button appearance.
class ReadMoreExpandableText extends StatelessWidget {
  /// The text content to display
  final String text;

  /// The maximum number of lines to show when collapsed
  final int maxLines;

  /// The style to apply to the text
  final TextStyle? textStyle;

  /// The style to apply to the "See More"/"See Less" button
  final TextStyle? buttonStyle;

  /// The text to show for the expand button
  final String expandText;

  /// The text to show for the collapse button
  final String collapseText;

  /// The icon to show for the expand button
  final IconData expandIcon;

  /// The icon to show for the collapse button
  final IconData collapseIcon;

  /// The color of the expand/collapse icons
  final Color? iconColor;

  /// The size of the expand/collapse icons
  final double iconSize;

  /// The padding to apply around the expand/collapse button
  final EdgeInsets buttonPadding;

  const ReadMoreExpandableText({
    super.key,
    required this.text,
    this.maxLines = 3,
    this.textStyle,
    this.buttonStyle,
    this.expandText = 'See More',
    this.collapseText = 'See Less',
    this.expandIcon = Icons.keyboard_arrow_down,
    this.collapseIcon = Icons.keyboard_arrow_up,
    this.iconColor,
    this.iconSize = 17.5,
    this.buttonPadding = const EdgeInsets.only(top: 12.0),
  });

  @override
  Widget build(BuildContext context) {
    return _ReadMoreExpandableTextContent(
      text: text,
      maxLines: maxLines,
      textStyle: textStyle,
      buttonStyle: buttonStyle,
      expandText: expandText,
      collapseText: collapseText,
      expandIcon: expandIcon,
      collapseIcon: collapseIcon,
      iconColor: iconColor,
      iconSize: iconSize,
      buttonPadding: buttonPadding,
    );
  }
}

class _ReadMoreExpandableTextContent extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? textStyle;
  final TextStyle? buttonStyle;
  final String expandText;
  final String collapseText;
  final IconData expandIcon;
  final IconData collapseIcon;
  final Color? iconColor;
  final double iconSize;
  final EdgeInsets buttonPadding;

  const _ReadMoreExpandableTextContent({
    required this.text,
    required this.maxLines,
    this.textStyle,
    this.buttonStyle,
    required this.expandText,
    required this.collapseText,
    required this.expandIcon,
    required this.collapseIcon,
    this.iconColor,
    required this.iconSize,
    required this.buttonPadding,
  });

  @override
  State<_ReadMoreExpandableTextContent> createState() =>
      _ReadMoreExpandableTextContentState();
}

class _ReadMoreExpandableTextContentState
    extends State<_ReadMoreExpandableTextContent> {
  late ValueNotifier<bool> _expanded;
  late TextPainter _textPainter;
  late int _numberOfLines;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _expanded = ValueNotifier(false);
    _textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: widget.textStyle ??
            const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 11.0,
              color: Colors.black,
            ),
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _calculateTextMetrics();
  }

  @override
  void didUpdateWidget(_ReadMoreExpandableTextContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text ||
        oldWidget.maxLines != widget.maxLines ||
        oldWidget.textStyle != widget.textStyle) {
      _calculateTextMetrics();
    }
  }

  void _calculateTextMetrics() {
    final maxWidth =
        MediaQuery.of(context).size.width - 32; // Account for padding

    // Calculate with maxLines
    _textPainter.text = TextSpan(
      text: widget.text,
      style: widget.textStyle ??
          const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 11.0,
            color: Colors.black,
          ),
    );
    _textPainter.maxLines = widget.maxLines;
    _textPainter.layout(maxWidth: maxWidth);
    final maxLinesHeight = _textPainter.height;

    // Calculate without maxLines
    _textPainter.maxLines = null;
    _textPainter.layout(maxWidth: maxWidth);
    final totalHeight = _textPainter.height;

    _numberOfLines = (totalHeight / (maxLinesHeight / widget.maxLines)).ceil();
    _isInitialized = true;
  }

  @override
  void dispose() {
    _expanded.dispose();
    _textPainter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const SizedBox.shrink();
    }

    return ValueListenableBuilder<bool>(
      valueListenable: _expanded,
      builder: (context, isExpanded, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              maxLines: isExpanded ? null : widget.maxLines,
              overflow: isExpanded ? null : TextOverflow.ellipsis,
              style: widget.textStyle ??
                  const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 11.0,
                    color: Colors.black,
                  ),
            ),
            if (_numberOfLines > widget.maxLines)
              _ExpandableButton(
                isExpanded: isExpanded,
                expandText: widget.expandText,
                collapseText: widget.collapseText,
                expandIcon: widget.expandIcon,
                collapseIcon: widget.collapseIcon,
                iconColor: widget.iconColor,
                iconSize: widget.iconSize,
                buttonStyle: widget.buttonStyle,
                padding: widget.buttonPadding,
                onTap: () => _expanded.value = !isExpanded,
              ),
          ],
        );
      },
    );
  }
}

class _ExpandableButton extends StatelessWidget {
  final bool isExpanded;
  final String expandText;
  final String collapseText;
  final IconData expandIcon;
  final IconData collapseIcon;
  final Color? iconColor;
  final double iconSize;
  final TextStyle? buttonStyle;
  final EdgeInsets padding;
  final VoidCallback onTap;

  const _ExpandableButton({
    required this.isExpanded,
    required this.expandText,
    required this.collapseText,
    required this.expandIcon,
    required this.collapseIcon,
    this.iconColor,
    required this.iconSize,
    this.buttonStyle,
    required this.padding,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: padding,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isExpanded ? collapseText : expandText,
                style: buttonStyle ??
                    const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0,
                      color: Colors.blueAccent,
                    ),
              ),
              const SizedBox(width: 3.0),
              Icon(
                isExpanded ? collapseIcon : expandIcon,
                color: iconColor ?? Colors.blueAccent,
                size: iconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
