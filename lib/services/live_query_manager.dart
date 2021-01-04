import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class LiveQueryManager {
  LiveQuery liveQuery;
  Subscription subscription;
  final String adminId;
  QueryBuilder<ParseObject> query;

  LiveQueryManager.init(this.adminId) {
    liveQuery = LiveQuery();
    query = QueryBuilder<ParseObject>(ParseObject('Subscribers'))
      ..whereEqualTo('adminId', adminId);
  }

  Future<void> setSubscription() async {
    this.subscription = await this.liveQuery.client.subscribe(this.query);
    this.subscription.on(LiveQueryEvent.create, (value) async {
      // this function never gets called.
      // Terminal just shows ReSubScription:{}
      // To see screenshot, check assets/images/Screenshot.png
      print("val : $value");
      print("val : ${value.runtimeType}");
      print("subscriber name: ${(value as ParseObject).get('name')}");
    });
  }
}
