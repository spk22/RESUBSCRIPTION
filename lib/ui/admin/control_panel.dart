import 'package:flutter/material.dart';
import 'package:resubscription/services/live_query_manager.dart';

class ControlPanel extends StatefulWidget {
  final String adminId;
  ControlPanel({Key key, this.adminId}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  LiveQueryManager manager;

  Future<void> _activateLiveQuery() async {
    manager = LiveQueryManager.init(widget.adminId);
    await manager.setSubscription();
  }

  @override
  void initState() {
    _activateLiveQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
