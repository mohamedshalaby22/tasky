import 'package:haptic_feedback/haptic_feedback.dart';

extension HapticFeedbackExtension on Haptics {
  // Check if the device can vibrate
  static Future<bool> get canVibrateAsync async => await Haptics.canVibrate();

  // Vibrate with various feedback types
  static Future<void> vibrateSuccess() async {
    await Haptics.vibrate(HapticsType.success);
  }

  static Future<void> vibrateWarning() async {
    await Haptics.vibrate(HapticsType.warning);
  }

  static Future<void> vibrateError() async {
    await Haptics.vibrate(HapticsType.error);
  }

  static Future<void> vibrateLight() async {
    await Haptics.vibrate(HapticsType.light);
  }

  static Future<void> vibrateMedium() async {
    await Haptics.vibrate(HapticsType.medium);
  }

  static Future<void> vibrateHeavy() async {
    await Haptics.vibrate(HapticsType.heavy);
  }

  static Future<void> vibrateRigid() async {
    await Haptics.vibrate(HapticsType.rigid);
  }

  static Future<void> vibrateSoft() async {
    await Haptics.vibrate(HapticsType.soft);
  }

  static Future<void> vibrateSelection() async {
    await Haptics.vibrate(HapticsType.selection);
  }
}
