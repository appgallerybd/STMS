import 'package:flutter/material.dart';

void main() {
  runApp(const StmsApp());
}

class StmsApp extends StatelessWidget {
  const StmsApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF087F5B);
    return MaterialApp(
      title: 'STMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFF6F8F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8F7),
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xFFE7ECE9)),
          ),
        ),
      ),
      home: const StmsHomePage(),
    );
  }
}

class StmsHomePage extends StatefulWidget {
  const StmsHomePage({super.key});

  @override
  State<StmsHomePage> createState() => _StmsHomePageState();
}

class _StmsHomePageState extends State<StmsHomePage> {
  int _selectedIndex = 0;

  static const _prayers = <PrayerTime>[
    PrayerTime(name: 'ফজর', time: 'ভোর ৪:৪৫', icon: Icons.wb_twilight_rounded),
    PrayerTime(name: 'যোহর', time: 'দুপুর ১২:১০', icon: Icons.wb_sunny_outlined),
    PrayerTime(name: 'আসর', time: 'বিকেল ৪:৩০', icon: Icons.sunny_snowing),
    PrayerTime(name: 'মাগরিব', time: 'সন্ধ্যা ৬:০২', icon: Icons.wb_twilight),
    PrayerTime(name: 'ইশা', time: 'রাত ৭:২৫', icon: Icons.nightlight_round),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      _buildHome(),
      const _SimplePage(
        icon: Icons.mosque_outlined,
        title: 'কাছের মসজিদ',
        subtitle: 'অনুমোদিত মসজিদ ও মানচিত্রের সুবিধা পরবর্তী ধাপে যুক্ত হবে।',
      ),
      const _SimplePage(
        icon: Icons.notifications_none_rounded,
        title: 'নোটিফিকেশন',
        subtitle: 'নামাজের সময় ও মসজিদের আপডেট এখানে দেখা যাবে।',
      ),
      const _SimplePage(
        icon: Icons.person_outline_rounded,
        title: 'আমার অ্যাকাউন্ট',
        subtitle: 'লগইন ও প্রোফাইল সুবিধা পরবর্তী ধাপে যুক্ত হবে।',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            _BrandMark(),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STMS', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 1.1)),
                Text('সালাত টাইম ম্যানেজমেন্ট সিস্টেম',
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'নোটিফিকেশন',
            onPressed: () => setState(() => _selectedIndex = 2),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          child: pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'হোম'),
          NavigationDestination(icon: Icon(Icons.mosque_outlined), selectedIcon: Icon(Icons.mosque_rounded), label: 'মসজিদ'),
          NavigationDestination(icon: Icon(Icons.notifications_none_rounded), selectedIcon: Icon(Icons.notifications_rounded), label: 'আপডেট'),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded), selectedIcon: Icon(Icons.person_rounded), label: 'প্রোফাইল'),
        ],
      ),
    );
  }

  Widget _buildHome() {
    return ListView(
      key: const ValueKey('home'),
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 24),
      children: [
        const Text('আসসালামু আলাইকুম',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF172B24))),
        const SizedBox(height: 5),
        Text('আপনার এলাকার নামাজের সময় এক নজরে',
            style: TextStyle(fontSize: 14, color: Colors.blueGrey.shade600)),
        const SizedBox(height: 20),
        const _NextPrayerCard(),
        const SizedBox(height: 22),
        Row(
          children: [
            const Expanded(
              child: Text('আজকের নামাজের সময়',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            ),
            Text('ডেমো তথ্য', style: TextStyle(fontSize: 12, color: Colors.orange.shade800)),
          ],
        ),
        const SizedBox(height: 10),
        Card(
          child: Column(
            children: [
              for (var i = 0; i < _prayers.length; i++) ...[
                _PrayerRow(prayer: _prayers[i]),
                if (i != _prayers.length - 1)
                  const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFEFF2F0)),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('আপনার মসজিদ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4EE),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.location_on_outlined, color: Color(0xFF087F5B)),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('আপনার এলাকার মসজিদ খুঁজুন',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      SizedBox(height: 4),
                      Text('মসজিদ খুঁজতে লোকেশন সুবিধা চালু করুন',
                          style: TextStyle(fontSize: 12, color: Colors.black54)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'নোট: এখানে প্রদর্শিত নামাজের সময়গুলো নমুনা। সঠিক স্থানীয় সময়ের জন্য লাইভ ডেটা সংযোগ করা হবে।',
          style: TextStyle(fontSize: 12, height: 1.5, color: Colors.black54),
        ),
      ],
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF087F5B),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Icon(Icons.mosque_rounded, color: Colors.white, size: 23),
    );
  }
}

class _NextPrayerCard extends StatelessWidget {
  const _NextPrayerCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF087F5B), Color(0xFF075C45)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.access_time_rounded, color: Colors.white70, size: 18),
              SizedBox(width: 7),
              Text('পরবর্তী নামাজ', style: TextStyle(color: Colors.white70, fontSize: 13)),
              Spacer(),
              Icon(Icons.auto_awesome_outlined, color: Colors.white70, size: 18),
            ],
          ),
          SizedBox(height: 18),
          Text('যোহর', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800)),
          SizedBox(height: 4),
          Text('দুপুর ১২:১০', style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(height: 18),
          Divider(color: Colors.white24, height: 1),
          SizedBox(height: 12),
          Row(
            children: [
              Icon(Icons.info_outline_rounded, color: Colors.white70, size: 16),
              SizedBox(width: 7),
              Expanded(
                child: Text('সময়টি নমুনা; লাইভ সময় পরে যুক্ত হবে',
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrayerRow extends StatelessWidget {
  const _PrayerRow({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5F0),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(prayer.icon, color: const Color(0xFF087F5B), size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(prayer.name, style: const TextStyle(fontWeight: FontWeight.w700))),
          Text(prayer.time, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
        ],
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  const _SimplePage({required this.icon, required this.title, required this.subtitle});

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 76,
              height: 76,
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4EE),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, color: const Color(0xFF087F5B), size: 36),
            ),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black54, height: 1.5)),
          ],
        ),
      ),
    );
  }
}

class PrayerTime {
  const PrayerTime({required this.name, required this.time, required this.icon});

  final String name;
  final String time;
  final IconData icon;
}
