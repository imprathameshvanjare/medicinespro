import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  Widget _buildReportCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's Report",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildReportItem('5', 'Total', Colors.blue),
              _buildReportItem('3', 'Taken', Colors.blue),
              _buildReportItem('1', 'Missed', Colors.blue),
              _buildReportItem('1', 'Snoozed', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check Dashboard',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Here you will find everything related to your active and past medicines.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 40,
                height: 40,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: 0.7,
                      strokeWidth: 4,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                    ),
                    CircularProgressIndicator(
                      value: 0.3,
                      strokeWidth: 4,
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Check History',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDayItem('SUN', '1', true),
              _buildDayItem('MON', '2', false),
              _buildDayItem('TUE', '3', false),
              _buildDayItem('WED', '4', false),
              _buildDayItem('THU', '5', false),
              _buildDayItem('FRI', '6', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDayItem(String day, String date, bool isSelected) {
    return Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 8),
        CircleAvatar(
          radius: 16,
          backgroundColor: isSelected ? Colors.blue : Colors.grey.shade100,
          child: Text(
            date,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMedicationItem(
      String name, String timing, String day, String status, Color iconColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(
              Icons.water_drop,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                timing,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Text(
                                  'Day $day',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_active_outlined,
                          size: 20,
                          color: status == 'Taken'
                              ? Colors.green
                              : status == 'Missed'
                                  ? Colors.red
                                  : Colors.orange,
                        ),
                        Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          // decoration: BoxDecoration(
                          //   color: status == 'Taken'
                          //       ? Colors.green.shade100
                          //       : status == 'Missed'
                          //           ? Colors.red.shade100
                          //           : Colors.orange.shade100,
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          children: [
            Text(
              'Report',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            _buildReportCard(),
            _buildDashboardSection(),
            _buildHistorySection(),
            const SizedBox(height: 16),
            const Text(
              'Morning 08:00 am',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            _buildMedicationItem(
              'Calpol 500mg Tablet',
              'Before Breakfast',
              '01',
              'Taken',
              Colors.purple,
            ),
            _buildMedicationItem(
              'Calpol 500mg Tablet',
              'Before Breakfast',
              '27',
              'Missed',
              Colors.pink,
            ),
            const SizedBox(height: 16),
            const Text(
              'Afternoon 02:00 pm',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            _buildMedicationItem(
              'Calpol 500mg Tablet',
              'After Food',
              '01',
              'Snoozed',
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}

enum MedicationStatus {
  taken,
  missed,
  snoozed,
  upcoming,
}

class Medication {
  final String name;
  final String time;
  final String instruction;
  final int day;
  final MedicationStatus status;
  final Color color;
  final IconData icon;

  Medication({
    required this.name,
    required this.time,
    required this.instruction,
    required this.day,
    required this.status,
    required this.color,
    required this.icon,
  });
}

class MedicationCard extends StatelessWidget {
  final Medication medication;

  const MedicationCard({
    Key? key,
    required this.medication,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData statusIcon;
    String statusText;
    Color statusColor;

    switch (medication.status) {
      case MedicationStatus.taken:
        statusIcon = Icons.check;
        statusText = 'Taken';
        statusColor = Colors.green;
        break;
      case MedicationStatus.missed:
        statusIcon = Icons.close;
        statusText = 'Missed';
        statusColor = Colors.red;
        break;
      case MedicationStatus.snoozed:
        statusIcon = Icons.notifications_off;
        statusText = 'Snoozed';
        statusColor = Colors.orange;
        break;
      case MedicationStatus.upcoming:
        statusIcon = Icons.access_time;
        statusText = 'Left';
        statusColor = Colors.blue;
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: medication.color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              medication.icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      medication.instruction,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Day ${medication.day.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  statusIcon,
                  color: statusColor,
                  size: 14,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                statusText,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmptyBoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final Path boxPath = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double boxSize = size.width * 0.7;

    boxPath.moveTo(centerX, centerY - boxSize / 4);
    boxPath.lineTo(centerX + boxSize / 2, centerY);
    boxPath.lineTo(centerX, centerY + boxSize / 4);
    boxPath.lineTo(centerX - boxSize / 2, centerY);
    boxPath.close();

    final Paint fillPaint = Paint()
      ..color = Colors.grey.shade700
      ..style = PaintingStyle.fill;
    canvas.drawPath(boxPath, fillPaint);

    boxPath.moveTo(centerX - boxSize / 2, centerY);
    boxPath.lineTo(centerX, centerY + boxSize / 4);
    boxPath.lineTo(centerX + boxSize / 2, centerY);
    boxPath.lineTo(centerX, centerY - boxSize / 4);
    boxPath.close();
    canvas.drawPath(boxPath, paint);

    final Path flapPath = Path();
    flapPath.moveTo(centerX + boxSize / 2, centerY);
    flapPath.quadraticBezierTo(
      centerX + boxSize / 1.5,
      centerY - boxSize / 5,
      centerX + boxSize / 1.3,
      centerY - boxSize / 2.5,
    );

    Path flapPath2 = Path();
    flapPath2.moveTo(centerX, centerY - boxSize / 4);
    flapPath2.quadraticBezierTo(
      centerX + boxSize / 8,
      centerY - boxSize / 2,
      centerX + boxSize / 6,
      centerY - boxSize / 1.5,
    );

    canvas.drawPath(flapPath, paint);
    canvas.drawPath(flapPath2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
