import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  int _selectedCompartment = 1;
  Color _selectedColor = const Color(0xFFF8BBD0);
  String _selectedType = 'Tablet';
  String _quantityText = 'Take 1/2 Pill';
  int _totalCount = 1;

  final List<Color> _colors = [
    const Color(0xFFF8BBD0),
    const Color(0xFFD1C4E9),
    const Color(0xFFFFAB91),
    const Color(0xFFDCEDC8),
    const Color(0xFFFFE0B2),
    const Color(0xFFB3E5FC),
    const Color(0xFFFFF59D),
  ];

  final List<String> _medicineTypes = ['Tablet', 'Capsule', 'Cream', 'Liquid'];

  final List<Map<String, dynamic>> _doses = [
    {'title': 'Dose 1', 'time': 'Morning'},
    {'title': 'Dose 2', 'time': 'Afternoon'},
    {'title': 'Dose 2', 'time': 'Evening'},
  ];

  final List<String> _instructions = [
    'Before Food',
    'After Food',
    'Before Sleep'
  ];
  String _selectedInstruction = 'Before Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add Medicines',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Medicine Name',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                    suffixIcon: Icon(Icons.mic, color: Colors.grey.shade400),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Compartment',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(7, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCompartment = index + 1;
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: _selectedCompartment == index + 1
                              ? Colors.blue.shade50
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: _selectedCompartment == index + 1
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Colour',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_colors.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = _colors[index];
                        });
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: _colors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedColor == _colors[index]
                                ? Colors.blue
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Type',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_medicineTypes.length, (index) {
                    final type = _medicineTypes[index];
                    IconData icon;

                    switch (type) {
                      case 'Tablet':
                        icon = Icons.circle;
                        break;
                      case 'Capsule':
                        icon = Icons.medication;
                        break;
                      case 'Cream':
                        icon = Icons.shopping_bag_outlined;
                        break;
                      case 'Liquid':
                        icon = Icons.local_drink_outlined;
                        break;
                      default:
                        icon = Icons.circle;
                    }

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = type;
                        });
                      },
                      child: Container(
                        width: 64,
                        margin: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: _selectedType == type
                                    ? _selectedColor.withOpacity(0.5)
                                    : Colors.grey.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                icon,
                                color: _selectedType == type
                                    ? _selectedColor
                                    : Colors.grey.shade400,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              type,
                              style: TextStyle(
                                color: _selectedType == type
                                    ? Colors.black
                                    : Colors.grey.shade400,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          _quantityText,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.remove, color: Colors.blue.shade400),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const IconButton(
                      icon: Icon(Icons.add, color: Colors.white),
                      onPressed: null,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Count',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    width: 44,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        _totalCount.toString().padLeft(2, '0'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.blue.shade400,
                  inactiveTrackColor: Colors.grey.shade200,
                  thumbColor: Colors.blue.shade400,
                  overlayColor: Colors.blue.shade200.withOpacity(0.2),
                  trackHeight: 4,
                ),
                child: Column(
                  children: [
                    Slider(
                      value: _totalCount.toDouble(),
                      min: 1,
                      max: 100,
                      onChanged: (value) {
                        setState(() {
                          _totalCount = value.toInt();
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            '01',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Set Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Today',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'End Date',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Frequency of Days',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Everyday',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'How many times a Day',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 44,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Three Time',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(_doses.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          _doses[index]['title'],
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _instructions.map((instruction) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedInstruction = instruction;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedInstruction == instruction
                              ? Colors.blue.shade100
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedInstruction == instruction
                                ? Colors.blue.shade400
                                : Colors.grey.shade300,
                          ),
                        ),
                        child: Text(instruction,
                            style: _selectedInstruction == instruction
                                ? TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  )
                                : TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabletIcon extends StatelessWidget {
  final Color color;

  const TabletIcon({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: 12,
          height: 2,
          color: Colors.white,
        ),
      ),
    );
  }
}
