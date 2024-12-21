import 'package:flutter/material.dart';

class MesssagueFiledBox extends StatelessWidget {
  const MesssagueFiledBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final  focusNode = FocusNode();


    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDeciration = InputDecoration(
      hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          final textValue = textController.value.text;
          print('Button: $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside:(event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDeciration,
      onFieldSubmitted: (value) {
        print('Submit value $value'); 
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
} 
