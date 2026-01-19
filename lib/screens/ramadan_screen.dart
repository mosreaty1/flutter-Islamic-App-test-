import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_theme.dart';

class RamadanScreen extends StatefulWidget {
  const RamadanScreen({super.key});

  @override
  State<RamadanScreen> createState() => _RamadanScreenState();
}

class _RamadanScreenState extends State<RamadanScreen> {
  final Set<int> _fastingDays = {};
  late HijriCalendar _hijriDate;

  @override
  void initState() {
    super.initState();
    _hijriDate = HijriCalendar.now();
    _loadFastingDays();
  }

  Future<void> _loadFastingDays() async {
    final prefs = await SharedPreferences.getInstance();
    final days = prefs.getStringList('fasting_days') ?? [];
    setState(() {
      _fastingDays.addAll(days.map((e) => int.parse(e)));
    });
  }

  Future<void> _saveFastingDays() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'fasting_days',
      _fastingDays.map((e) => e.toString()).toList(),
    );
  }

  void _toggleFastingDay(int day) {
    setState(() {
      if (_fastingDays.contains(day)) {
        _fastingDays.remove(day);
      } else {
        _fastingDays.add(day);
      }
    });
    _saveFastingDays();
  }

  @override
  Widget build(BuildContext context) {
    final isRamadan = _hijriDate.hMonth == 9;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ramadan',
          style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildRamadanHeader(isRamadan),
            if (isRamadan) ...[
              _buildFastingProgress(),
              _buildRamadanCalendar(),
            ] else
              _buildNotRamadanMessage(),
            _buildRamadanInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildRamadanHeader(bool isRamadan) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryGreen, AppTheme.darkGreen],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.nights_stay, color: AppTheme.secondaryGold, size: 48),
          const SizedBox(height: 12),
          Text(
            'رمضان كريم',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            isRamadan
                ? 'Ramadan Mubarak!'
                : 'May Allah bless us with Ramadan',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '${_hijriDate.hDay} ${_hijriDate.longMonthName} ${_hijriDate.hYear}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFastingProgress() {
    final completedDays = _fastingDays.length;
    final progress = completedDays / 30;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fasting Progress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$completedDays/30 Days',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 20,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppTheme.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRamadanCalendar() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ramadan Calendar',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  final day = index + 1;
                  final isCompleted = _fastingDays.contains(day);
                  final isToday = day == _hijriDate.hDay;

                  return InkWell(
                    onTap: () => _toggleFastingDay(day),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? AppTheme.primaryGreen
                            : (isToday
                                ? AppTheme.secondaryGold.withOpacity(0.3)
                                : Colors.grey[200]),
                        borderRadius: BorderRadius.circular(8),
                        border: isToday
                            ? Border.all(color: AppTheme.secondaryGold, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              day.toString(),
                              style: TextStyle(
                                color: isCompleted ? Colors.white : Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (isCompleted)
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Tap on a day to mark it as fasted',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotRamadanMessage() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Icon(
                Icons.calendar_month,
                size: 64,
                color: Colors.grey[400],
              ),
              const SizedBox(height: 16),
              const Text(
                'Ramadan is not currently active',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'May Allah bless us to witness the blessed month of Ramadan',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRamadanInfo() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'About Ramadan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildInfoItem(
                Icons.book,
                'The Virtue of Ramadan',
                'Ramadan is the ninth month of the Islamic calendar and the holiest month for Muslims.',
              ),
              _buildInfoItem(
                Icons.star,
                'Fasting',
                'Muslims fast from dawn to sunset, abstaining from food, drink, and sinful behavior.',
              ),
              _buildInfoItem(
                Icons.auto_awesome,
                'Laylat al-Qadr',
                'The Night of Power, better than a thousand months, falls in the last ten nights.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryGreen, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
