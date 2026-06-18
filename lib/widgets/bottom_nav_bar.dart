import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex; // 0 = Home, 1 = Doctor/Detail, 2 = Profile

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF7BAE8E),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.home,
              label: "Home",
              isActive: currentIndex == 0,
              onTap: () {
                if (currentIndex != 0) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/home',
                    (route) => false,
                  );
                }
              },
            ),
            _NavItem(
              icon: Icons.medical_services,
              label: "Doctor",
              isActive: currentIndex == 1,
              onTap: () {},
            ),
            _NavItem(
              icon: Icons.person,
              label: "Profile",
              isActive: currentIndex == 2,
              onTap: () {
                if (currentIndex != 2) {
                  Navigator.pushNamed(context, '/profile');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white70, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white70,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
