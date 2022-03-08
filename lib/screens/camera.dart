import 'dart:ffi';
import 'dart:io';
//import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;
 var _url = '';


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    print(barcode!.code);
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        
        
        buildQrView(context),
        Positioned(bottom: 100, child: buildResult()),
        Positioned(width: MediaQuery.of(context).size.width * 0.6 , 
        top: MediaQuery.of(context).size.height * 0.1,
        child: Image.asset("assets/images/logo.png")),
      ]),
    );
  }

  Widget buildResult() => Container(
    
    height: MediaQuery.of(context).size.width * 0.2 ,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(20.0),
      color: Colors.white24
    ),
    child: Text(
    
      barcode != null? 'Resut : ${barcode!.code}':'!امسح الباركود',
      style: TextStyle(color: Colors.white,
      fontSize: MediaQuery.of(context).size.width * 0.1),
      maxLines: 3,
    ),
  );
  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
        borderLength: 30,
        borderRadius: 10,
        borderColor: Color.fromRGBO(88,140,126, 1.0),
      ));

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }

//   void _launchURL() async {
//   if (!await launch(_url)) throw 'Could not launch $_url';
// }
}
