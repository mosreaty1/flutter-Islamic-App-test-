import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import '../utils/app_theme.dart';

class IslamicCalendarScreen extends StatefulWidget {
  const IslamicCalendarScreen({super.key});

  @override
  State<IslamicCalendarScreen> createState() => _IslamicCalendarScreenState();
}

class _IslamicCalendarScreenState extends State<IslamicCalendarScreen> {
  late HijriCalendar _hijriDate;
  late DateTime _selectedDate;

  final List<Map<String, dynamic>> _islamicEvents = [
    {
      'month': 1,
      'day': 1,
      'name': 'Islamic New Year',
      'description': 'First day of Muharram',
    },
    {
      'month': 1,
      'day': 10,
      'name': 'Day of Ashura',
      'description': 'Day of fasting and remembrance',
    },
    {
      'month': 3,
      'day': 12,
      'name': 'Mawlid al-Nabi',
      'description': 'Birth of Prophet Muhammad (SAW)',
    },
    {
      'month': 7,
      'day': 27,
      'name': 'Isra and Mi\'raj',
      'description': 'Night Journey and Ascension',
    },
    {
      'month': 8,
      'day': 15,
      'name': 'Mid-Sha\'ban',
      'description': 'Night of forgiveness',
    },
    {
      'month': 9,
      'day': 1,
      'name': 'Start of Ramadan',
      'description': 'Beginning of fasting month',
    },
    {
      'month': 9,
      'day': 27,
      'name': 'Laylat al-Qadr',
      'description': 'Night of Power',
    },
    {
      'month': 10,
      'day': 1,
      'name': 'Eid al-Fitr',
      'description': 'Festival of Breaking the Fast',
    },
    {
      'month': 12,
      'day': 9,
      'name': 'Day of Arafah',
      'description': 'Day of Hajj pilgrimage',
    },
    {
      'month': 12,
      'day': 10,
      'name': 'Eid al-Adha',
      'description': 'Festival of Sacrifice',
    },
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _hijriDate = HijriCalendar.fromDate(_selectedDate);
  }

  void _updateDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _hijriDate = HijriCalendar.fromDate(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Islamic Calendar',
          style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCurrentDateCard(),
            _buildDateConverter(),
            _buildUpcomingEvents(),
            _buildIslamicMonths(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentDateCard() {
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
          const Icon(Icons.calendar_month, color: AppTheme.secondaryGold, size: 48),
          const SizedBox(height: 16),
          Text(
            'Today\'s Hijri Date',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${_hijriDate.hDay} ${_hijriDate.longMonthName} ${_hijriDate.hYear} AH',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              DateFormat('EEEE, MMMM d, yyyy').format(_selectedDate),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateConverter() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Date Converter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gregorian Date',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat('MMM d, yyyy').format(_selectedDate),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward, color: AppTheme.primaryGreen),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Hijri Date',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${_hijriDate.hDay} ${_hijriDate.longMonthName}',
                          style: GoogleFonts.amiri(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    _updateDate(date);
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: const Text('Select Date'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 45),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    // Filter events that are upcoming in the current Hijri year
    final upcomingEvents = _islamicEvents.where((event) {
      final eventMonth = event['month'] as int;
      final eventDay = event['day'] as int;

      // Check if event is in current month or later
      if (eventMonth > _hijriDate.hMonth) return true;
      if (eventMonth == _hijriDate.hMonth && eventDay >= _hijriDate.hDay) return true;

      return false;
    }).take(3).toList();

    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Upcoming Islamic Events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              if (upcomingEvents.isEmpty)
                const Text(
                  'No upcoming events this year',
                  style: TextStyle(color: Colors.grey),
                )
              else
                ...upcomingEvents.map((event) => _buildEventItem(event)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(Map<String, dynamic> event) {
    final monthNames = [
      'Muharram', 'Safar', 'Rabi\' al-awwal', 'Rabi\' al-thani',
      'Jumada al-awwal', 'Jumada al-thani', 'Rajab', 'Sha\'ban',
      'Ramadan', 'Shawwal', 'Dhu al-Qi\'dah', 'Dhu al-Hijjah'
    ];
    final monthName = monthNames[event['month'] - 1];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.creamWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  event['day'].toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  monthName.substring(0, 3),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryGreen,
                  ),
                ),
                Text(
                  event['description'],
                  style: const TextStyle(
                    fontSize: 13,
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

  Widget _buildIslamicMonths() {
    final months = [
      'Muharram',
      'Safar',
      'Rabi\' al-awwal',
      'Rabi\' al-thani',
      'Jumada al-awwal',
      'Jumada al-thani',
      'Rajab',
      'Sha\'ban',
      'Ramadan',
      'Shawwal',
      'Dhu al-Qi\'dah',
      'Dhu al-Hijjah',
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Islamic Months',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...months.asMap().entries.map((entry) {
                final index = entry.key + 1;
                final month = entry.value;
                final isCurrent = index == _hijriDate.hMonth;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isCurrent
                        ? AppTheme.primaryGreen.withOpacity(0.1)
                        : Colors.transparent,
                    border: Border.all(
                      color: isCurrent
                          ? AppTheme.primaryGreen
                          : Colors.grey.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? AppTheme.primaryGreen
                              : Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              color: isCurrent ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        month,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCurrent ? AppTheme.primaryGreen : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
