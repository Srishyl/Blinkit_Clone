import 'package:flutter/material.dart';
import '../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), onPressed: () {}),
        title: const Text('Profile & Account', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileBanner(),
            _buildSection('MY ACTIVITY', [
              _buildListTile(Icons.shopping_bag_outlined, 'My Orders'),
              _buildListTile(Icons.location_on_outlined, 'Saved Addresses'),
              _buildListTile(Icons.payment_outlined, 'Payment Methods'),
              _buildListTile(Icons.card_giftcard_outlined, 'Rewards & Coupons', badge: '3'),
            ]),
            _buildSection('PREFERENCES', [
              _buildListTile(Icons.notifications_none_outlined, 'Notifications'),
              _buildListTile(Icons.translate_outlined, 'Language', trailingText: 'English'),
              _buildSwitchTile(Icons.dark_mode_outlined, 'Dark Mode'),
            ]),
            _buildSection('SUPPORT', [
              _buildListTile(Icons.help_outline, 'Help & Support'),
              _buildListTile(Icons.star_outline, 'Rate the App'),
              _buildListTile(Icons.security_outlined, 'Terms & Privacy'),
            ]),
            const SizedBox(height: 32),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            const Text('Version 4.2.0 (2024)', style: TextStyle(color: Colors.grey, fontSize: 10)),
            const Text('Made with ❤️ in India', style: TextStyle(color: Colors.grey, fontSize: 10)),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFFF2FAF2), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                  child: const Icon(Icons.edit, color: Colors.white, size: 12),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('+91 98765 43210', style: TextStyle(color: Colors.grey, fontSize: 12)),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  child: const Text('EDIT PROFILE', style: TextStyle(color: Color(0xFF1E56B2), fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildListTile(IconData icon, String title, {String? badge, String? trailingText}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xFFF2F3F5), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: const Color(0xFF1E56B2), size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badge != null)
             Container(
               padding: const EdgeInsets.all(6),
               decoration: const BoxDecoration(color: Color(0xFF1E56B2), shape: BoxShape.circle),
               child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
             ),
          if (trailingText != null)
             Text(trailingText, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 18),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: const Color(0xFFF2F3F5), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: const Color(0xFF1E56B2), size: 20),
      ),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      trailing: Switch(
        value: isDarkMode,
        onChanged: (v) => setState(() => isDarkMode = v),
        activeColor: const Color(0xFFD4F400),
      ),
    );
  }
}
