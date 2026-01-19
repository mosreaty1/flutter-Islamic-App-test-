import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_theme.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen> {
  int _count = 0;
  int _targetCount = 33;
  String _selectedDhikr = 'SubhanAllah';

  final Map<String, String> _dhikrOptions = {
    'SubhanAllah': 'سُبْحَانَ اللّٰهِ',
    'Alhamdulillah': 'الْحَمْدُ لِلّٰهِ',
    'Allahu Akbar': 'اللّٰهُ أَكْبَرُ',
    'La ilaha illallah': 'لَا إِلٰهَ إِلَّا اللّٰهُ',
    'Astaghfirullah': 'أَسْتَغْفِرُ اللّٰهَ',
  };

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = prefs.getInt('tasbih_count') ?? 0;
      _selectedDhikr = prefs.getString('selected_dhikr') ?? 'SubhanAllah';
      _targetCount = prefs.getInt('target_count') ?? 33;
    });
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tasbih_count', _count);
    await prefs.setString('selected_dhikr', _selectedDhikr);
    await prefs.setInt('target_count', _targetCount);
  }

  void _incrementCount() {
    setState(() {
      _count++;
      if (_count >= _targetCount && _count % _targetCount == 0) {
        _showCompletionDialog();
      }
    });
    _saveCounter();
  }

  void _resetCount() {
    setState(() {
      _count = 0;
    });
    _saveCounter();
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Masha Allah!'),
        content: Text('You have completed $_targetCount dhikr!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_count % _targetCount) / _targetCount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasbih Counter',
          style: GoogleFonts.amiri(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.flag),
            onSelected: (value) {
              setState(() {
                _targetCount = value;
              });
              _saveCounter();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 11, child: Text('Target: 11')),
              const PopupMenuItem(value: 33, child: Text('Target: 33')),
              const PopupMenuItem(value: 99, child: Text('Target: 99')),
              const PopupMenuItem(value: 100, child: Text('Target: 100')),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildDhikrSelector(),
                  const SizedBox(height: 32),
                  _buildCounterDisplay(progress),
                  const SizedBox(height: 32),
                  _buildTapArea(),
                  const SizedBox(height: 32),
                  _buildDhikrList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDhikrSelector() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryGreen, AppTheme.darkGreen],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            _dhikrOptions[_selectedDhikr] ?? '',
            style: GoogleFonts.amiri(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedDhikr,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterDisplay(double progress) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppTheme.primaryGreen,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    _count.toString(),
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryGreen,
                    ),
                  ),
                  Text(
                    'of $_targetCount',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Completed: ${(_count / _targetCount).floor()} times',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTapArea() {
    return Column(
      children: [
        GestureDetector(
          onTap: _incrementCount,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [AppTheme.primaryGreen, AppTheme.darkGreen],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryGreen.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.touch_app,
                color: Colors.white,
                size: 48,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _resetCount,
          icon: const Icon(Icons.refresh),
          label: const Text('Reset Counter'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildDhikrList() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Dhikr',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ..._dhikrOptions.entries.map((entry) {
                final isSelected = _selectedDhikr == entry.key;
                return Card(
                  color: isSelected
                      ? AppTheme.primaryGreen.withOpacity(0.1)
                      : Colors.white,
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _selectedDhikr = entry.key;
                      });
                      _saveCounter();
                    },
                    title: Text(
                      entry.value,
                      style: GoogleFonts.amiri(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? AppTheme.primaryGreen
                            : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      entry.key,
                      style: TextStyle(
                        color: isSelected
                            ? AppTheme.primaryGreen
                            : Colors.grey[600],
                      ),
                    ),
                    trailing: isSelected
                        ? const Icon(
                            Icons.check_circle,
                            color: AppTheme.primaryGreen,
                          )
                        : null,
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
