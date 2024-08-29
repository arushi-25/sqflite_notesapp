import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  NoteDetail(this.appBarTitle);

  @override
  State<NoteDetail> createState()=>_NoteDetailState(this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  
  static var _priorities = ['High','Low'];

    String appBarTitle;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    _NoteDetailState(this.appBarTitle);
  @override
  Widget build(BuildContext context) {

  TextStyle textStyle = Theme.of(context).textTheme.titleMedium ?? const TextStyle(fontSize: 18.0);
    return WillPopScope(
    onWillPop: () async {
       moveToLastScreen();
       return false;
    },
    child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(
          Icons.arrow_back),
          onPressed: (){
            moveToLastScreen();
          },
          ),
      ),

    body: Padding(
      padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
      child: ListView(
        children: <Widget>[
          ListTile(
            title: DropdownButton(
              items: _priorities.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              style: textStyle,
              value: 'Low',
               onChanged:(valueSelectedByUser){
                setState(() {
                  debugPrint('User selected $valueSelectedByUser');
                });
               }
              ),
          ),
          //second element
         Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
          child: TextField(
            controller: titleController,
            style: textStyle,
            onChanged: (value){
              debugPrint('Something changed in title text field');
            },
            decoration: InputDecoration(
              labelText: 'Title',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          ), 
        //third element
        Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
          child: TextField(
            controller: descriptionController,
            style: textStyle,
            onChanged: (value){
              debugPrint('Something changed in discription text field');
            },
            decoration: InputDecoration(
              labelText: 'Discription',
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
          ),   
        //fourth element
        Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Theme.of(context).primaryColor, // Background color
                  foregroundColor: Colors.white, // Text color
                ),
                  child:Text(
                    'Save',
                    textScaleFactor: 1.5,
                  ),
                  onPressed:(){
                    setState(() {
                      debugPrint("Save button clicked");
                    });
                  }
                )),

            Container(width: 5.0,),

            Expanded(
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Theme.of(context).primaryColor, // Background color
                  foregroundColor: Colors.white, // Text color
                ),
                  child:Text(
                    'Delete',
                    textScaleFactor: 1.5,
                  ),
                  onPressed:(){
                    setState(() {
                      debugPrint("Delete button clicked");
                    });
                  }
                ))    
            ],
          ),
          )
        ],
      ),
      ),
    ));
  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}