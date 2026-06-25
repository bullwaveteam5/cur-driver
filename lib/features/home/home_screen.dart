import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/floating_nav_bar.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/info_tile.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/stat_card.dart';
import '../earnings/earnings_screen.dart';
import '../profile/profile_screen.dart';
import '../trips/trip_request_screen.dart';
import '../trips/trips_history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = [
      _HomeDashboard(),
      TripsHistoryScreen(),
      EarningsScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: FloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          NavItem(icon: Icons.grid_view_rounded, label: 'Home'),
          NavItem(icon: Icons.receipt_long_rounded, label: 'Trips'),
          NavItem(icon: Icons.bar_chart_rounded, label: 'Earnings'),
          NavItem(icon: Icons.person_rounded, label: 'Profile'),
        ],
      ),
    );
  }
}

class _HomeDashboard extends StatefulWidget {
  const _HomeDashboard();

  @override
  State<_HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<_HomeDashboard> {
  bool _isOnline = true;

  void _acceptRide() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const TripRequestScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildOnlineCard(),
            const SizedBox(height: 22),
            const SectionHeader(title: "Today's Overview"),
            const SizedBox(height: 14),
            _buildStatsGrid(),
            const SizedBox(height: 24),
            const SectionHeader(title: 'Live Location'),
            const SizedBox(height: 14),
            _buildMap(),
            const SizedBox(height: 24),
            _buildRideRequest(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: AppColors.primaryGradient,
          ),
          child: const CircleAvatar(
            radius: 26,
            backgroundColor: AppColors.surface,
            child: Icon(
              Icons.person_rounded,
              color: AppColors.primary,
              size: 30,
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back,',
                style: TextStyle(color: AppColors.subText, fontSize: 13),
              ),
              const SizedBox(height: 2),
              const Text(
                'Rahul Sharma',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded,
                            color: AppColors.warning, size: 14),
                        SizedBox(width: 3),
                        Text(
                          '4.9',
                          style: TextStyle(
                            color: AppColors.warning,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.text,
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.danger,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.surface, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOnlineCard() {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      gradient: _isOnline ? AppColors.primaryGradient : null,
      borderColor: _isOnline ? Colors.transparent : AppColors.glassBorder,
      glow: _isOnline ? AppColors.primary : null,
      blur: !_isOnline,
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: _isOnline ? 0.2 : 0.06),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              _isOnline ? Icons.flash_on_rounded : Icons.flash_off_rounded,
              color: _isOnline ? Colors.white : AppColors.muted,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _isOnline ? 'You are Online' : 'You are Offline',
                  style: TextStyle(
                    color: _isOnline ? Colors.white : AppColors.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _isOnline
                      ? 'Receiving ride requests'
                      : 'Go online to start earning',
                  style: TextStyle(
                    color: _isOnline ? Colors.white70 : AppColors.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: _isOnline,
            thumbColor: const WidgetStatePropertyAll(Colors.white),
            trackColor: WidgetStatePropertyAll(
              _isOnline
                  ? Colors.white.withValues(alpha: 0.35)
                  : AppColors.surfaceAlt,
            ),
            trackOutlineColor:
                const WidgetStatePropertyAll(Colors.transparent),
            onChanged: (value) => setState(() => _isOnline = value),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        mainAxisExtent: 142,
      ),
      children: const [
        StatCard(
          title: "Today's Earnings",
          value: '₹2,450',
          icon: Icons.currency_rupee_rounded,
          gradient: AppColors.primaryGradient,
          iconColor: AppColors.primary,
        ),
        StatCard(
          title: 'Trips Completed',
          value: '18',
          icon: Icons.check_circle_rounded,
          gradient: AppColors.blueGradient,
          iconColor: AppColors.accent,
        ),
        StatCard(
          title: 'Wallet Balance',
          value: '₹3,800',
          icon: Icons.account_balance_wallet_rounded,
          gradient: AppColors.successGradient,
          iconColor: AppColors.success,
        ),
        StatCard(
          title: 'Online Time',
          value: '8h 24m',
          icon: Icons.timer_rounded,
          gradient: AppColors.goldGradient,
          iconColor: AppColors.warning,
        ),
      ],
    );
  }

  Widget _buildMap() {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: _MapGridPainter()),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.10),
                      AppColors.background.withValues(alpha: 0.55),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 50,
              child: _mapPin(AppColors.accent, Icons.circle, 14),
            ),
            Positioned(
              right: 50,
              bottom: 56,
              child: _mapPin(AppColors.danger, Icons.location_on_rounded, 22),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.6),
                          blurRadius: 22,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.navigation_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.glassBorder),
                    ),
                    child: const Text(
                      'You are here',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mapPin(Color color, IconData icon, double size) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: size),
    );
  }

  Widget _buildRideRequest() {
    return GlassCard(
      glow: AppColors.primary,
      borderColor: AppColors.primary.withValues(alpha: 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.notifications_active_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'New Ride Request',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: AppColors.successGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '₹420',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const InfoTile(
            icon: Icons.my_location_rounded,
            label: 'Pickup',
            value: 'Airport Terminal 2',
          ),
          const SizedBox(height: 14),
          const InfoTile(
            icon: Icons.location_on_rounded,
            label: 'Drop',
            value: 'Railway Station',
            iconColor: AppColors.danger,
          ),
          const SizedBox(height: 14),
          const InfoTile(
            icon: Icons.route_rounded,
            label: 'Distance',
            value: '12 km',
            iconColor: AppColors.accent,
          ),
          const SizedBox(height: 20),
          CustomButton(
            label: 'Accept Ride',
            icon: Icons.check_rounded,
            onPressed: _acceptRide,
          ),
        ],
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint bgPaint = Paint()..color = const Color(0xFF101A30);
    canvas.drawRect(Offset.zero & size, bgPaint);

    final Paint linePaint = Paint()
      ..color = const Color(0xFF1C2A47)
      ..strokeWidth = 1;

    const double step = 28;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    final Paint roadPaint = Paint()
      ..color = const Color(0xFF273A5E)
      ..strokeWidth = 6;
    canvas.drawLine(
      Offset(0, size.height * 0.7),
      Offset(size.width, size.height * 0.3),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.6, size.height),
      roadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
