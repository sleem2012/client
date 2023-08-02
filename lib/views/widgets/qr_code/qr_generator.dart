import 'package:flutter/material.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/helper.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeView extends StatelessWidget {
  const QRCodeView({Key? key, required this.qrCode}) : super(key: key);
  final String qrCode;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: MediaQuery.of(context).viewInsets,
        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
        decoration: KHelper.of(context).elevatedBox,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QrImage(
              data: qrCode,
              backgroundColor: KColors.of(context).background.withOpacity(.0),
              foregroundColor: KColors.of(context).reBackground,

            ),

            // Expanded(
            //   child: SizedBox(
            //     height: 20,
            //     child: RawMaterialButton(
            //       onPressed: () {},
            //       fillColor: KColors.of(context).trackColor,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            //       child: FittedBox(
            //         child: Text(
            //           qrCode?? '',
            //           style: KTextStyle.of(context).editBTN.copyWith(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key, required this.onDataCallback}) : super(key: key);
  final void Function(String?) onDataCallback;

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.resumeCamera();

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        widget.onDataCallback(scanData.code);

        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: KColors.of(context).accentColor,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutHeight: 300,
                cutOutWidth: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode : ${result!.code}',
                      textAlign: TextAlign.center,
                    )
                  :  Text(
                      Tr.get.scan_code,
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
