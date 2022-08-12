import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scanner/aadhar.model.dart';
import 'package:xml/xml.dart';

class ParseScreen extends StatefulWidget {
  static const Routename = 'parsescreen';
  ParseScreen({Key? key,required this.args}) : super(key: key);
  final String args;
  @override
  State<ParseScreen> createState() => _ParseScreenState();
}

class _ParseScreenState extends State<ParseScreen> {
String parse = '';
Aadhar s = Aadhar(uid: '', name: '', addres: '', dob: '', co: '', state: '', pc: '');
  String namestd = 'PrintLetterBarcodeData';
  @override
  Widget build(BuildContext context) {

  var p = XmlDocument.parse(widget.args);
  log('fdsfd: ${p.toXmlString()}');
try{
  var d = p.getElement('PrintLetterBarcodeData');
  if(d!=null){
var uid = d.getAttribute('uid') ;
    var name = d.getAttribute('name') ;
    var dob = d.getAttribute('dob') ;
    var co = d.getAttribute('co') ;
    var loc = d.getAttribute('loc') ;
    var state = d.getAttribute('state') ;
    var pc = d.getAttribute('pc');
    s = Aadhar(uid: uid as String, name: name as String, addres: loc as String, dob: dob as String, co: co as String, state: state as String, pc: pc as String);
  }
}catch(e){
  log('${e.toString()}');
}


  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aadhar Details'),
      ),

      body: Column(
        children:[
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Text('Aadhar:${s.uid}'),
                Text('Name:${s.name}'),
                Text('State:${s.state}'),
                Text('DOB:${s.dob}'),
                Text('Address:${s.addres}'),
                Text('CO:${s.co}'),
                Text('Pincode:${s.pc}'),
              ],
            )
          ),
        )
        ]

      ),
    );
  }
}