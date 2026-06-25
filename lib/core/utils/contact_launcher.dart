import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/support_contacts.dart';

class ContactLauncher {
  ContactLauncher._();

  static Future<bool> callSupport() async {
    return _launch(Uri.parse('tel:${SupportContacts.supportPhone}'));
  }

  static Future<bool> openWhatsApp({String? message}) async {
    final String text = Uri.encodeComponent(
      message ?? SupportContacts.documentVerifyMessage,
    );
    final Uri uri = Uri.parse(
      'https://wa.me/${SupportContacts.whatsAppNumber}?text=$text',
    );
    return _launch(uri);
  }

  static Future<bool> emailSupport({String? subject, String? body}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: SupportContacts.supportEmail,
      query: _encodeQuery({
        'subject': subject ?? 'WaveGo Driver - Document Verification',
        'body': body ?? SupportContacts.documentVerifyMessage,
      }),
    );
    return _launch(uri);
  }

  static String? _encodeQuery(Map<String, String> params) {
    final entries = params.entries
        .where((e) => e.value.isNotEmpty)
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .toList();
    if (entries.isEmpty) return null;
    return entries.join('&');
  }

  static Future<bool> _launch(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      return launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return false;
  }

  static void showLaunchError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not open. Please try another option.'),
      ),
    );
  }
}
