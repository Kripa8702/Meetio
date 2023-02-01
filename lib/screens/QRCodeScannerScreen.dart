// import 'dart:io';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRCodeScannerScreen extends StatefulWidget {
//   const QRCodeScannerScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
// }
//
// class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: _onQRViewCreated,
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: (result != null)
//                   ? Text(
//                       'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
//                   : Text('Scan a code'),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
