import 'package:flutter/material.dart';

class InsertInfoWidget extends StatelessWidget {
  final String dataName;
  final bool isRequired;
  final FormFieldSetter<String> onSaved;

  const InsertInfoWidget(
      {super.key,
      required this.dataName,
      required this.onSaved,
      required this.isRequired});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: dataName,
                border: const OutlineInputBorder(),
              ),
              onSaved: onSaved,
              validator: (value) {
                if (isRequired == true && value!.isEmpty) {
                  return '$dataName 입력';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}
