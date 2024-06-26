import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController data=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Screen 2"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: data,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                labelText: "Enter data"
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
                onPressed: (){
                  if(data.text.toString().isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter data")));
                    return;
                  }
                  Navigator.of(context).pop(data.text.toString());
                },
                child:Text("Back"),
            )
          ],
        ),
      ),
    );
  }
}
