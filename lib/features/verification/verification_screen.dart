import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/support_contact_cards.dart';
import '../home/home_screen.dart';

enum DocStatus { verified, pending, upload }

class _DocItem {
  _DocItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  DocStatus status;
}

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<_DocItem> _docs = [
    _DocItem(
      icon: Icons.account_circle_rounded,
      title: 'Profile Photo',
      subtitle: 'Clear photo of your face',
      status: DocStatus.verified,
    ),
    _DocItem(
      icon: Icons.badge_rounded,
      title: 'Driving License',
      subtitle: 'Front and back side',
      status: DocStatus.verified,
    ),
    _DocItem(
      icon: Icons.directions_car_rounded,
      title: 'Vehicle RC',
      subtitle: 'Registration certificate',
      status: DocStatus.pending,
    ),
    _DocItem(
      icon: Icons.credit_card_rounded,
      title: 'Aadhaar Card',
      subtitle: 'Identity proof',
      status: DocStatus.upload,
    ),
    _DocItem(
      icon: Icons.assignment_ind_rounded,
      title: 'PAN Card',
      subtitle: 'Tax identification',
      status: DocStatus.upload,
    ),
  ];

  int get _verifiedCount =>
      _docs.where((d) => d.status == DocStatus.verified).length;

  bool get _allVerified => _verifiedCount == _docs.length;

  void _onDocTap(_DocItem doc) {
    if (doc.status == DocStatus.verified) return;
    setState(() => doc.status = DocStatus.verified);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${doc.title} verified')),
    );
  }

  void _continue() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _verifiedCount / _docs.length;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(progress),
                      const SizedBox(height: 24),
                      const Text(
                        'Required Documents',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Tap a document to upload and verify it',
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ..._docs.map(_buildDocTile),
                      const SizedBox(height: 8),
                      const Text(
                        'Need help verifying?',
                        style: TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Contact our team — WhatsApp is fastest for document review.',
                        style: TextStyle(
                          color: AppColors.subText,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const SupportContactCards(compact: true),
                    ],
                  ),
                ),
              ),
              _buildBottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double progress) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 26,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.verified_user_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Partner Verification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Complete KYC to start earning',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                '$_verifiedCount of ${_docs.length} verified',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${(progress * 100).round()}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.25),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocTile(_DocItem doc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: const EdgeInsets.all(14),
        blur: false,
        onTap: () => _onDocTap(doc),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.25),
                ),
              ),
              child: Icon(doc.icon, color: AppColors.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc.title,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    doc.subtitle,
                    style: const TextStyle(
                      color: AppColors.muted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _buildStatusChip(doc.status),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(DocStatus status) {
    late final Color color;
    late final String label;
    late final IconData icon;
    switch (status) {
      case DocStatus.verified:
        color = AppColors.success;
        label = 'Verified';
        icon = Icons.check_circle_rounded;
        break;
      case DocStatus.pending:
        color = AppColors.warning;
        label = 'Pending';
        icon = Icons.hourglass_top_rounded;
        break;
      case DocStatus.upload:
        color = AppColors.accent;
        label = 'Upload';
        icon = Icons.upload_rounded;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
      decoration: const BoxDecoration(
        color: AppColors.backgroundAlt,
        border: Border(top: BorderSide(color: AppColors.glassBorder)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_allVerified)
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.warning,
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'You can continue and complete pending docs later',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          CustomButton(
            label: _allVerified ? 'Continue' : 'Skip & Continue',
            icon: Icons.arrow_forward_rounded,
            onPressed: _continue,
          ),
        ],
      ),
    );
  }
}
