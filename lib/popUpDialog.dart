import 'package:flutter/material.dart';

class PopUpDialog extends StatefulWidget {
  const PopUpDialog({super.key});

  @override
  State<PopUpDialog> createState() => _PopUpDialogState();
}

class _PopUpDialogState extends State<PopUpDialog> {
  bool isEnabled=true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: isEnabled? Colors.green:Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("This ia a pop up dialog."),
              Row(
                children: [
                  Text("Change color: "),
                  Switch(
                      value: isEnabled,
                      onChanged: (value){
                        setState((){
                          isEnabled=value;
                        });
                      }
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
