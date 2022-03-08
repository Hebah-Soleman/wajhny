import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
           padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [QrImage(
                data: controller.text,
                size: MediaQuery.of(context).size.width * 0.8,
                backgroundColor: Colors.greenAccent,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1,),
              buildTextField(context)
              ]
            )),
      ),
    );
  }

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      );
}
