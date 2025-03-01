import 'package:flutter/material.dart';
import 'package:medicinepro/connectivity/connectivity_service.dart';
import 'package:medicinepro/screens/settingsscreen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConnectivityService _connectivityService;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _connectivityService = ConnectivityService();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _connectivityService.initialize(context);
    });
  }

  int _currentDateIndex = 4;

  final List<String> _dates = [
    'Tuesday, Aug 30',
    'Wednesday, Aug 31',
    'Thursday, Sep 1',
    'Friday, Sep 2',
    'Saturday, Sep 3',
    'Sunday, Sep 4',
    'Monday, Sep 5',
    'Tuesday, Sep 6',
    'Wednesday, Sep 7',
    'Thursday, Sep 8',
  ];

  final List<String> _shortDays = [
    'Tu',
    'We',
    'Th',
    'Fr',
    'Sa',
    'Su',
    'Mo',
    'Tu',
    'We',
    'Th'
  ];

  final List<Medication> _medications = [
    Medication(
      name: 'Calpol 500mg Tablet',
      time: 'Morning 08:00 am',
      instruction: 'Before Breakfast',
      day: 1,
      status: MedicationStatus.taken,
      color: Colors.pink.shade100,
      icon: Icons.water_drop,
    ),
    Medication(
      name: 'Calpol 500mg Tablet',
      time: 'Morning 08:00 am',
      instruction: 'Before Breakfast',
      day: 27,
      status: MedicationStatus.missed,
      color: Colors.blue.shade100,
      icon: Icons.medication,
    ),
    Medication(
      name: 'Calpol 500mg Tablet',
      time: 'Afternoon 02:00 pm',
      instruction: 'After Food',
      day: 1,
      status: MedicationStatus.snoozed,
      color: Colors.purple.shade100,
      icon: Icons.water_drop,
    ),
    Medication(
      name: 'Calpol 500mg Tablet',
      time: 'Night 09:00 pm',
      instruction: 'Before Sleep',
      day: 3,
      status: MedicationStatus.upcoming,
      color: Colors.red.shade100,
      icon: Icons.edit,
    ),
    Medication(
      name: 'Aspirin 75mg Tablet',
      time: 'Night 09:00 pm',
      instruction: 'After Dinner',
      day: 5,
      status: MedicationStatus.upcoming,
      color: Colors.green.shade100,
      icon: Icons.medication,
    ),
  ];

  void _goToPreviousDate() {
    setState(() {
      if (_currentDateIndex > 0) {
        _currentDateIndex--;
      }
    });
  }

  void _goToNextDate() {
    setState(() {
      if (_currentDateIndex < _dates.length - 1) {
        _currentDateIndex++;
      }
    });
  }

  Future<void> _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {}
    } catch (e) {
      print('Error opening camera: $e');
    }
  }

  bool get _isSaturdaySep3 => _currentDateIndex == 4;

  @override
  Widget build(BuildContext context) {
    final String currentDate = _dates[_currentDateIndex];

    final String prevDay =
        _currentDateIndex > 0 ? _shortDays[_currentDateIndex - 1] : '';

    final String nextDay = _currentDateIndex < _dates.length - 1
        ? _shortDays[_currentDateIndex + 1]
        : '';

    final String nextNextDay = _currentDateIndex < _dates.length - 2
        ? _shortDays[_currentDateIndex + 2]
        : '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hi Harry!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _openCamera,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SettingsScreen(),
                          ));
                        },
                        child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 16,
                            backgroundImage: AssetImage("assets/boy.png")),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _isSaturdaySep3 ? '5 Medicines Left' : '0 Medicines Left',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        'hr',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        prevDay,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: const Icon(Icons.chevron_left),
                        onPressed: _goToPreviousDate,
                        color: Colors.grey.shade600,
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          currentDate,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        onPressed: _goToNextDate,
                        color: Colors.grey.shade600,
                        iconSize: 20,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        nextDay,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        nextNextDay,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: _isSaturdaySep3
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _medications.length,
                      itemBuilder: (context, index) {
                        final medication = _medications[index];
                        final showHeader = index == 0 ||
                            _medications[index].time.split(' ')[0] !=
                                _medications[index - 1].time.split(' ')[0];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (showHeader)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 10),
                                child: Text(
                                  medication.time,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            MedicationCard(medication: medication),
                          ],
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 80,
                                height: 80,
                                child: CustomPaint(
                                  painter: EmptyBoxPainter(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Nothing Is Here, Add a Medicine',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
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
