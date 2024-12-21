import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  MessageFieldBoxState createState() => MessageFieldBoxState();
}

class MessageFieldBoxState extends State<MessageFieldBox> {
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDeciration = InputDecoration(
      hintText: 'End your message with a "?"', // Placeholder que siempre debe mostrarse
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.text.trim();
          if (textValue.isNotEmpty) {
            widget.onValue(textValue);
            textController.clear(); // Limpia el campo de texto
            focusNode.requestFocus(); // Mantén el foco en el campo
            setState(() {}); // Asegura la actualización del widget
          }
        },
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDeciration,
      onFieldSubmitted: (value) {
        final textValue = value.trim();
        if (textValue.isNotEmpty) {
          widget.onValue(textValue);
          textController.clear();
          focusNode.requestFocus();
          setState(() {}); // Asegura la actualización del widget
        }
      },
    );
  }
}
