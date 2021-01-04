import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:resubscription/app_keys.dart';

class ParseService {
  static init() async {
    await Parse().initialize(
      AppKeys.APP_ID,
      AppKeys.APP_SERVER_URL,
      clientKey: AppKeys.APP_CLIENT_KEY,
      masterKey: AppKeys.APP_MASTER_KEY,
      autoSendSessionId: true,
      debug: false,
      liveQueryUrl: AppKeys.APP_LIVE_QUERY_URL,
      coreStore: await CoreStoreSharedPrefsImp.getInstance(),
    );
  }

  // returns objectId of admin after loggin in
  static Future<String> login(String userName, String password) async {
    final user = ParseUser(userName, password, userName);
    final ParseResponse response = await user.login();
    String uid = (response.success) ? user.objectId : null;
    return uid;
  }

  static Future<void> subscribeUser(String name, String adminId) async {
    final ParseObject object = ParseObject('Subscribers');
    final response = await object.create();
    if (response.success && response.count > 0) {
      final ParseObject record = response.results[0];
      record.set('name', name);
      record.set('adminId', adminId);
      await record.save();
    }
  }
}
