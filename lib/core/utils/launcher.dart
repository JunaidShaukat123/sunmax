import 'package:share_plus/share_plus.dart';

import '/core/app_export.dart';

class Launcher {
  SharePlus share = SharePlus.instance;

  /// Make a phone call
  static Future<void> makePhoneCall(String phone) async {
    try {
      final Uri url = Uri(scheme: 'tel', path: phone);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Send an SMS
  static Future<void> sendSms(String phone, String message) async {
    try {
      final Uri url = Uri(
        scheme: 'sms',
        path: phone,
        queryParameters: {'body': message},
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Send a WhatsApp message
  static Future<void> sendViaWhatsApp(String phone, String message) async {
    try {
      final Uri url = Uri.parse(
        "https://wa.me/$phone?text=${Uri.encodeComponent(message)}",
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Make a WhatsApp call
  static Future<void> makeWhatsAppCall(String phone) async {
    try {
      final Uri url = Uri.parse("https://wa.me/$phone?call");
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw Exception('Could not launch WhatsApp call $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Share content
  static Future<ShareResult> shareContent(String content) async {
    try {
      ShareParams params = ShareParams(text: content);

      ///
      return await SharePlus.instance.share(params);
    } catch (e) {
      throw Exception(e);
    }
  }

  /// Open a URL in a browser
  static Future<void> openUrl(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch $url');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
