import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quran_screen.dart';
import 'prayer_times_screen.dart';
import 'ramadan_screen.dart';
import 'tasbih_screen.dart';
import 'hadith_screen.dart';
import 'dua_screen.dart';
import 'islamic_calendar_screen.dart';
import '../services/prayer_service.dart';
import '../utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PrayerService>().calculatePrayerTimes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ramadan Quran Kareem',
          style: GoogleFonts.amiri(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPrayerTimesCard(context),
            _buildGridMenu(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPrayerTimesCard(BuildContext context) {
    return Consumer<PrayerService>(
      builder: (context, prayerService, child) {
        if (prayerService.isLoading) {
          return Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            child: const Card(
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (prayerService.error != null) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 8),
                    Text(
                      'Error loading prayer times',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => prayerService.calculatePrayerTimes(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final prayerTimes = prayerService.prayerTimes;
        if (prayerTimes == null) {
          return const SizedBox.shrink();
        }

        final nextPrayer = prayerTimes.getNextPrayer();
        final nextPrayerTime = prayerTimes.getNextPrayerTime();

        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppTheme.primaryGreen, AppTheme.darkGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white70, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      prayerService.locationName ?? 'Unknown',
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Next Prayer: $nextPrayer',
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _formatTime(nextPrayerTime!),
                  style: const TextStyle(
                    color: AppTheme.secondaryGold,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PrayerTimesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.primaryGreen,
                  ),
                  child: const Text('View All Prayer Times'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final menuItems = [
      {
        'title': 'Quran',
        'icon': Icons.book,
        'screen': const QuranScreen(),
        'color': AppTheme.primaryGreen,
      },
      {
        'title': 'Prayer Times',
        'icon': Icons.access_time,
        'screen': const PrayerTimesScreen(),
        'color': AppTheme.darkGreen,
      },
      {
        'title': 'Ramadan',
        'icon': Icons.nights_stay,
        'screen': const RamadanScreen(),
        'color': AppTheme.secondaryGold,
      },
      {
        'title': 'Tasbih',
        'icon': Icons.circle_outlined,
        'screen': const TasbihScreen(),
        'color': AppTheme.lightGreen,
      },
      {
        'title': 'Hadith',
        'icon': Icons.menu_book,
        'screen': const HadithScreen(),
        'color': AppTheme.softBrown,
      },
      {
        'title': 'Duas',
        'icon': Icons.favorite,
        'screen': const DuaScreen(),
        'color': AppTheme.primaryGreen,
      },
      {
        'title': 'Islamic Calendar',
        'icon': Icons.calendar_month,
        'screen': const IslamicCalendarScreen(),
        'color': AppTheme.darkGreen,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.2,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return _buildMenuItem(
            context,
            title: item['title'] as String,
            icon: item['icon'] as IconData,
            color: item['color'] as Color,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => item['screen'] as Widget,
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.amiri(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}
