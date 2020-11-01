import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

 class ProductDisplay extends StatefulWidget {
//   final  String name;
   ProductDisplay();

   @override
   _ProductDisplayState createState() => _ProductDisplayState();

 }
 
 class _ProductDisplayState extends State<ProductDisplay> {
  @override
  void initState(){
    super.initState();
//    getdata();
  }

  getdata() async{
    var url="https://www.daraz.com.bd/";
    print(url);
    var response = await http.get(url);
    dom.Document document= parser.parse(response.body);


  }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.deepPurple[200],
       body: SingleChildScrollView(
         physics:ScrollPhysics(),
         child: Column(
           children: <Widget>[
             Text("hello")
           ],
         ),
       ),
     );
   }
 }
