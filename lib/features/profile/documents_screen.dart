import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/glass_card.dart';
import '../../core/widgets/section_header.dart';

enum _DocStatus { verified, pending }

class _Document {
  const _Document({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final _DocStatus status;
}

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  static const List<_Document> _docs = [
    _Document(
      icon: Icons.account_circle_rounded,
      title: 'Profile Photo',
      subtitle: 'Uploaded · Approved',
      status: _DocStatus.verified,
    ),
    _Document(
      icon: Icons.badge_rounded,
      title: 'Driving License',
      subtitle: 'DL-0420211234567 · Valid till 2031',
      status: _DocStatus.verified,
    ),
    _Document(
      icon: Icons.directions_car_rounded,
      title: 'Vehicle RC',
      subtitle: 'DL01AB1234 · Under review',
      status: _DocStatus.pending,
    ),
    _Document(
      icon: Icons.credit_card_rounded,
      title: 'Aadhaar Card',
      subtitle: 'XXXX-XXXX-4321 · Verified',
      status: _DocStatus.verified,
    ),
    _Document(
      icon: Icons.assignment_ind_rounded,
      title: 'PAN Card',
      subtitle: 'ABCDE1234F · Verified',
      status: _DocStatus.verified,
    ),
  ];

  int get _verifiedCount =>
      _docs.where((d) => d.status == _DocStatus.verified).length;

  void _uploadNew(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Document upload coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progress = _verifiedCount / _docs.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documents'),
        leading: const BackButton(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _buildSummary(progress),
              const SizedBox(height: 24),
              const SectionHeader(title: 'Your Documents'),
              const SizedBox(height: 14),
              ..._docs.map(_buildDocCard),
              const SizedBox(height: 10),
              CustomButton(
                label: 'Upload New Document',
                icon: Icons.upload_file_rounded,
                onPressed: () => _uploadNew(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(double progress) {
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
                  Icons.folder_shared_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_verifiedCount of ${_docs.length} Verified',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Your KYC documents status',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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

  Widget _buildDocCard(_Document doc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GlassCard(
        padding: const EdgeInsets.all(14),
        blur: false,
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

  Widget _buildStatusChip(_DocStatus status) {
    final bool verified = status == _DocStatus.verified;
    final Color color = verified ? AppColors.success : AppColors.warning;
    final String label = verified ? 'Verified' : 'Pending';
    final IconData icon =
        verified ? Icons.check_circle_rounded : Icons.hourglass_top_rounded;
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
}
