import 'package:collabsession/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key, required Activity activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const HeroIcon(HeroIcons.chevronLeft, size: 20),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Detail Kegiatan',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
