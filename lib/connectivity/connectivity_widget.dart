import 'package:flutter/material.dart';

void showNoConnectionDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              const Text(
                'Your Device is not connected',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomPaint(
                size: const Size(120, 120),
                painter: DisconnectedCharacterPainter(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Connect your device with',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF7B9EF8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      icon: const Icon(Icons.bluetooth, color: Colors.white),
                      label: const Text(''),
                      onPressed: () {
                        // Handle Bluetooth connection
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.white.withOpacity(0.5),
                  ),
                  Expanded(
                    child: TextButton.icon(
                      icon: const Icon(Icons.wifi, color: Colors.white),
                      label: const Text(''),
                      onPressed: () {
                        // Handle WiFi connection
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class DisconnectedCharacterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint bluePaint = Paint()
      ..color = const Color(0xFFB8C8FF)
      ..style = PaintingStyle.fill;

    final Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, bluePaint);

    final xEyeLeft = Path()
      ..moveTo(size.width / 2 - 20, size.height / 2 - 10)
      ..lineTo(size.width / 2 - 10, size.height / 2)
      ..moveTo(size.width / 2 - 20, size.height / 2)
      ..lineTo(size.width / 2 - 10, size.height / 2 - 10);

    final xEyeRight = Path()
      ..moveTo(size.width / 2 + 10, size.height / 2 - 10)
      ..lineTo(size.width / 2 + 20, size.height / 2)
      ..moveTo(size.width / 2 + 10, size.height / 2)
      ..lineTo(size.width / 2 + 20, size.height / 2 - 10);

    canvas.drawPath(xEyeLeft, blackPaint);
    canvas.drawPath(xEyeRight, blackPaint);

    final mouth = Path()
      ..moveTo(size.width / 2 - 20, size.height / 2 + 15)
      ..quadraticBezierTo(size.width / 2, size.height / 2 + 25,
          size.width / 2 + 20, size.height / 2 + 15);

    canvas.drawPath(mouth, blackPaint);

    final lightning = Path()
      ..moveTo(size.width / 2 + 40, size.height / 2 - 20)
      ..lineTo(size.width / 2 + 30, size.height / 2)
      ..lineTo(size.width / 2 + 35, size.height / 2)
      ..lineTo(size.width / 2 + 25, size.height / 2 + 20);

    canvas.drawPath(
        lightning,
        Paint()
          ..color = const Color(0xFF7B9EF8)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2);

    canvas.drawLine(Offset(size.width / 2 - 40, size.height / 2 + 10),
        Offset(size.width / 2 - 60, size.height / 2 - 10), blackPaint);

    canvas.drawLine(Offset(size.width / 2 + 40, size.height / 2 + 10),
        Offset(size.width / 2 + 50, size.height / 2 + 30), blackPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
