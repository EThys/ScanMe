import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanme/widgets/showMsg.dart';


class QrcodeScan extends StatefulWidget {
  QrcodeScan({Key? key}) : super(key: key);

  @override
  State<QrcodeScan> createState() => _QrcodeScanState();
}

class _QrcodeScanState extends State<QrcodeScan> {
  bool flashOn = false;
  bool frontCam = false;
  GlobalKey qrKey = GlobalKey();
  QRViewController? qrController;
  String? resultScan;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        QRView(
            key: qrKey,
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
            onQRViewCreated: (QRViewController controller) {
              this.qrController = controller;
              controller.scannedDataStream.listen((scanData) async {
                resultScan = scanData.code;
                print("=======+++++++++++++++++++============$resultScan");
                print('hello999999999999999999999999999999999999999999999');
                controller.dispose();
                /*if (resultScan!.isNotEmpty) {
                  _gererScan(context, resultScan, controller);
                } else {
                  return;
                }*/
              });
            }),

        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 45),
            child: Text(
              'Eventify',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  color: Colors.white,
                  icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
                  onPressed: () {
                    setState(() {
                      flashOn = true;
                    });
                    qrController!.toggleFlash();
                  }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(frontCam ? Icons.camera_front : Icons.camera_rear),
                  onPressed: () {
                    setState(() {
                      frontCam = true;
                    });
                    qrController!.flipCamera();
                  }),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
      ],
    );
  }

  /*Future<void> _gererScan(BuildContext context,
      dynamic resultScan, controller) async {
    var data = jsonDecode(resultScan);
    var ScanCtrl = context.read<ScanController>();
    HttpResponse  result = await ScanCtrl.setPhoneApi(data!);

    if(result.status){
      switch (result.data!['message']) {
        case "scan":
          showMsg(
              context, true, "Qrcode scanné avec succès");
          controller.dispose();
          Navigator.pop(context);
          break;
        case "noscan":
          showMsg(context, false, "Qrcode deja scanné avec succès");
          controller.dispose();
          Navigator.pop(context);
          break;
        default:
          controller.dispose();
      }
    }
  }*/
}
