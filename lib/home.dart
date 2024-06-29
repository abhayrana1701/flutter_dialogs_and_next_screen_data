import 'package:flutter/material.dart';
import 'popUpDialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isEnabled1=true;
  bool isEnabled2=true;
  String info="none";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Dialogs and data from next screen "),
        backgroundColor: Colors.black,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Dialogs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Container(
              width:MediaQuery.of(context).size.width,
              child:Column(
                children: [
                  SizedBox(height:4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width*0.5),
                    ),
                    onPressed: (){
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return AlertDialog(
                              title: Text("Alert Dialog"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("This is an alert dialog."),
                                  Row(
                                    children: [
                                      Text("Text Field: "),
                                      Switch(
                                          value: isEnabled1,
                                          onChanged: (value){
                                            setState((){
                                              isEnabled1=value;
                                            });
                                          }
                                      ),
                                    ],
                                  ),
                                  TextField(
                                    enabled: isEnabled1,
                                  )
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                )
                              ],
                            );
                          },);
                        },
                      );
                    },
                    child: Text("Show Alert Dialog"),
                  ),
                  SizedBox(height:4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      fixedSize: Size.fromWidth(MediaQuery.of(context).size.width*0.5),
                    ),
                    onPressed: (){
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return Dialog(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("This is a custom dialog."),
                                      Row(
                                        children: [
                                          Text("Text Field and change color: "),
                                          Switch(
                                              value: isEnabled2,
                                              onChanged: (value){
                                                setState((){
                                                  isEnabled2=value;
                                                });
                                              }
                                          ),
                                        ],
                                      ),
                                      TextField(
                                        enabled: isEnabled2,
                                      ),
                                      ElevatedButton(
                                        onPressed: (){
                                          Navigator.pop(context);
                                        },
                                        child: Text("Close"),
                                      )
                                    ],
                                  ),
                                ),
                                color: isEnabled2 ? Colors.green : Colors.red,
                              ),
                            );
                          },);
                        },
                      );
                    },
                    child: Text("Show Alert Dialog"),
                  ),
                  SizedBox(height:4),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: Size.fromWidth(MediaQuery.of(context).size.width*0.5),
                      ),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) => PopUpDialog(),
                        ).then((value) =>{ info=value,setState((){})});
                      },
                      child: Text("Show Pop Up Dialog")
                  ),
                  SizedBox(height:4),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black),
              ),
            ),
            SizedBox(height:30),
            Text("Data from next screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            Container(
              width:MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(info),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Colors.black),
              ),
            ),
          ],
        ),
      )
    );
  }
}
