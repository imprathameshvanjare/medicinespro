import 'package:flutter/material.dart';
import 'package:medicinepro/screens/signinscreen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  Widget _buildSettingItem(
      IconData icon, String title, String subtitle, bool showSelectedColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: showSelectedColor
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            )
          : null,
      child: Row(
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDeviceSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildSettingItem(
            Icons.bluetooth,
            'Connect',
            'Bluetooth, Wi-Fi',
            false,
          ),
          _buildSettingItem(
            Icons.volume_up,
            'Sound Option',
            'Ring, Silent, Vibrate',
            true,
          ),
        ],
      ),
    );
  }

  Widget _buildCaretakerSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAvatarWithName('Dipa Luna', 'assets/avatar1.png'),
              _buildAvatarWithName('Roz Sod...', 'assets/avatar2.png'),
              _buildAvatarWithName('Sunny Tu...', 'assets/avatar3.png'),
              _buildAddAvatar(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarWithName(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey.shade400,
          // For actual implementation, use NetworkImage or AssetImage
          // backgroundImage: AssetImage(imagePath),
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAddAvatar() {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Icon(Icons.add, color: Colors.grey.shade400),
        ),
        const SizedBox(height: 8),
        const Text(
          'Add',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildDoctorSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade300,
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add Your Doctor',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Or use ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                'invite link',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.orangeAccent,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios),
          )),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment
                      .bottomRight, // Align the camera icon to the bottom right
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/boy.png"),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors
                              .blueAccent, // Border color for the camera icon
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 10,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                    width:
                        16), // Add some spacing between the avatar and the text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Take Care!',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Text(
                      'Richa Bose',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSettingItem(
                  Icons.notifications_outlined,
                  'Notification',
                  'Check your medicine notification',
                  false,
                ),
                _buildSettingItem(
                  Icons.volume_up_outlined,
                  'Sound',
                  'Ring, Silent, Vibrate',
                  false,
                ),
                _buildSettingItem(
                  Icons.person_outline,
                  'Manage Your Account',
                  'Password, Email ID, Phone Number',
                  false,
                ),
                _buildSettingItem(
                  Icons.notifications_outlined,
                  'Notification',
                  'Check your medicine notification',
                  false,
                ),
                _buildSettingItem(
                  Icons.notifications_outlined,
                  'Notification',
                  'Check your medicine notification',
                  false,
                ),
                _buildSectionTitle('Device'),
                _buildDeviceSection(),
                _buildSectionTitle('Caretakers: 03'),
                _buildCaretakerSection(),
                _buildSectionTitle('Doctor'),
                _buildDoctorSection(),
                const SizedBox(height: 24),
                _buildFooterItem('Privacy Policy'),
                _buildFooterItem('Terms of Use'),
                _buildFooterItem('Rate Us'),
                _buildFooterItem('Share'),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Colors.blue, width: 1),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      splashFactory: InkRipple.splashFactory,
                    ).copyWith(
                      overlayColor: MaterialStateProperty.all(
                        Colors.blue.withOpacity(
                            0.2), // Apply the same overlay color for all states
                      ),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
