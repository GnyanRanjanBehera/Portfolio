import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:portfolio/i18n/strings.g.dart';
import 'package:portfolio/shared/pods/internet_checker_pod.dart';
import 'package:portfolio/shared/pods/translation_pod.dart';
import 'package:platform_info/platform_info.dart';
import 'package:portfolio/bootstrap.dart';
import 'package:portfolio/core/storage/app_storage_pod.dart';
import 'package:portfolio/features/splash/controller/box_encryption_key_pod.dart';
import 'package:portfolio/init.dart';

import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

final futureInitializerPod =
    FutureProvider.autoDispose<ProviderContainer>((ref) async {
  ///Additional intial delay duration for app
  // await Future.delayed(const Duration(seconds: 1));
  await (init());
  await Hive.initFlutter();

  ///Replace `appBox` namw with any key you want

  final encryptionCipher = await Platform.I.when(
    mobile: () async {
      final encryptionKey = await ref.watch(boxEncryptionKeyPod.future);
      return HiveAesCipher(encryptionKey);
    },
  );

  ///Load device translations
  ///
  AppLocale deviceLocale = AppLocaleUtils.findDeviceLocale();
  final translations = await deviceLocale.build();

  final appBox = await Hive.openBox(
    'AppBox',
    encryptionCipher: encryptionCipher,
  );
  return ProviderContainer(
    overrides: [
      appBoxPod.overrideWithValue(appBox),
      translationsPod.overrideWith(
        (ref) => translations,
      ),
      enableInternetCheckerPod.overrideWithValue(false),
    ],
    observers: [
      ///Added new talker riverpod observer
      ///
      /// If you want old behaviour
      /// Replace with
      ///
      ///  MyObserverLogger( talker: talker,)
      ///
      ///
      ///
      ///
      TalkerRiverpodObserver(
        talker: talker,
        settings: const TalkerRiverpodLoggerSettings(
          printProviderDisposed: true,
        ),
      ),
    ],
  );
});
