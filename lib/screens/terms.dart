import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
           padding: EdgeInsets.all(24),
            
              child: Container(
                height: MediaQuery.of(context).size.height*0.9,
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(border: Border.all(width: 3.0,color: Color.fromRGBO(88,140,126, 1)),
                shape: BoxShape.rectangle),
          child: Column(
            children:[
              Text("لماذا وجهني"),
               Text("كثرة ضياع الحجاج بعد أدائهم فريضة معينة\n, أوعندما يريدون العودة إلى الحملةة)",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
               Text("من الصعب عليهم إيجاد موقع الحملة حتى إن بحثوا عنها في قوقل ماب لن يعطيهم مكان كل حملة بالتحديد"),
               Text("وهذه المشكلة قد تسبب زحام وضياع الوقت والجهد للحاج و للمنظمين ( رجال الامن و الكشافة")]),
        ),
      ),
    );
  }
}

