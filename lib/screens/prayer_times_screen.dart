import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/prayer_service.dart';
import '../utils/app_theme.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prayer Times',
          style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PrayerService>().calculatePrayerTimes();
            },
          ),
        ],
      ),
      body: Consumer<PrayerService>(
        builder: (context, prayerService, child) {
          if (prayerService.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (prayerService.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error loading prayer times',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    prayerService.error!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => prayerService.calculatePrayerTimes(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final prayerTimes = prayerService.prayerTimes;
          if (prayerTimes == null) {
            return const Center(child: Text('No prayer times available'));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                _buildLocationCard(prayerService),
                _buildNextPrayerCard(prayerTimes),
                _buildPrayerTimesList(prayerTimes),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocationCard(PrayerService prayerService) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.white, size: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  prayerService.locationName ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextPrayerCard(prayerTimesModel) {
    final nextPrayer = prayerTimesModel.getNextPrayer();
    final nextPrayerTime = prayerTimesModel.getNextPrayerTime();

    if (nextPrayerTime == null) return const SizedBox.shrink();

    final timeUntil = nextPrayerTime.difference(DateTime.now());
    final hours = timeUntil.inHours;
    final minutes = timeUntil.inMinutes.remainder(60);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.secondaryGold, Color(0xFFB8860B)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'Next Prayer',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            nextPrayer ?? '',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _formatTime(nextPrayerTime),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'in ${hours}h ${minutes}m',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerTimesList(prayerTimesModel) {
    final prayers = prayerTimesModel.allPrayers;
    final now = DateTime.now();

    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Column(
          children: prayers.entries.map((entry) {
            final isCurrent = entry.value.isAfter(now) &&
                entry.value == prayerTimesModel.getNextPrayerTime();

            return Container(
              decoration: BoxDecoration(
                color: isCurrent
                    ? AppTheme.primaryGreen.withOpacity(0.1)
                    : Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? AppTheme.primaryGreen
                        : AppTheme.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    _getPrayerIcon(entry.key),
                    color: isCurrent ? Colors.white : AppTheme.primaryGreen,
                  ),
                ),
                title: Text(
                  entry.key,
                  style: TextStyle(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                    color: isCurrent ? AppTheme.primaryGreen : Colors.black,
                  ),
                ),
                trailing: Text(
                  _formatTime(entry.value),
                  style: TextStyle(
                    fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                    color: isCurrent ? AppTheme.primaryGreen : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  IconData _getPrayerIcon(String prayer) {
    switch (prayer) {
      case 'Fajr':
        return Icons.wb_twilight;
      case 'Sunrise':
        return Icons.wb_sunny;
      case 'Dhuhr':
        return Icons.light_mode;
      case 'Asr':
        return Icons.wb_cloudy;
      case 'Maghrib':
        return Icons.nights_stay;
      case 'Isha':
        return Icons.nightlight;
      default:
        return Icons.access_time;
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}
