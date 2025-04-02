import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:portfolio/core/storage/app_storage.dart';

/// This provider used for App Storage Service class which
/// depends on appBoxProvider for getting intial Hive Box
final appStoragePod = Provider.autoDispose<AppStorage>(
  (ref) => AppStorage(ref.watch(appBoxPod)),
);

/// This provider used for Storing Hive Box which you can override on
/// bootstrap function on start of the app
final appBoxPod = Provider.autoDispose<Box>(
  (ref) => throw UnimplementedError("appBoxProvider is not overriden"),
);
