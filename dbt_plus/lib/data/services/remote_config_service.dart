import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final remoteConfigServiceProvider = Provider<RemoteConfigService>((ref) {
  final rc = FirebaseRemoteConfig.instance;
  return RemoteConfigService(rc);
});

class RemoteConfigService {
  RemoteConfigService(this._rc);
  final FirebaseRemoteConfig _rc;

  String get defaultAccentColor => _rc.getString('default_accent_color');
}
