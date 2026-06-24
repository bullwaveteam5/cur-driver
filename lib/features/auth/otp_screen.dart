import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/custom_button.dart';
import '../verification/verification_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phone = ''});

  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _verifyOtp() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const VerificationScreen()),
    );
  }

  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          counterText: '',
        ),
        onChanged: (value) => _onChanged(index, value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String phoneLabel =
        widget.phone.isEmpty ? 'your phone' : '+91 ${widget.phone}';

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: AppColors.primary,
                  size: 42,
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'Verify OTP',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the 4-digit code sent to $phoneLabel',
                style: const TextStyle(
                  color: AppColors.subText,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, _buildOtpBox),
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive code? ",
                    style: TextStyle(color: AppColors.subText),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: 'Verify OTP',
                icon: Icons.verified_user_rounded,
                onPressed: _verifyOtp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
