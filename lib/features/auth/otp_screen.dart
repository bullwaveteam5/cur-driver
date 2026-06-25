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
    final bool filled = _controllers[index].text.isNotEmpty;
    return SizedBox(
      width: 66,
      height: 66,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          color: AppColors.text,
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: filled ? AppColors.primary : AppColors.glassBorder,
              width: filled ? 1.6 : 1,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {});
          _onChanged(index, value);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String phoneLabel =
        widget.phone.isEmpty ? 'your phone' : '+91 ${widget.phone}';

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -110,
              left: -70,
              child: _glowOrb(240, AppColors.accent.withValues(alpha: 0.28)),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Container(
                      width: 78,
                      height: 78,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.45),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: AppColors.text,
                        fontSize: 30,
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
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive code? ",
                          style: TextStyle(color: AppColors.subText),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Resend'),
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
          ],
        ),
      ),
    );
  }

  Widget _glowOrb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withValues(alpha: 0)],
        ),
      ),
    );
  }
}
