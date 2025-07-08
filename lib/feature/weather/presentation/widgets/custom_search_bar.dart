import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    super.key,
    required this.onSearch,
  });

  final TextEditingController _textController = TextEditingController();
  final Function(String) onSearch;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final regEx = FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\\s-]"));
  bool isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    widget._textController.addListener(_handleTextChange);
    isTextEmpty = widget._textController.text.isEmpty;
  }

  @override
  void dispose() {
    widget._textController.removeListener(_handleTextChange);
    super.dispose();
  }

  void _handleTextChange() {
    final isNowEmpty = widget._textController.text.isEmpty;
    if (isNowEmpty != isTextEmpty) {
      setState(() {
        isTextEmpty = isNowEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: TextField(
        inputFormatters: [regEx],
        onSubmitted: (_) {
          if (widget._textController.text.isNotEmpty) {
            widget.onSearch(widget._textController.text);
          }
        },
        controller: widget._textController,
        decoration: InputDecoration(
          hintText: "Sök på stad",
          prefixIcon: IconButton(
            onPressed: isTextEmpty
                ? null
                : () => widget.onSearch(widget._textController.text),
            icon: Icon(
              Icons.search,
              color: isTextEmpty ? Colors.black12 : Colors.black,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
