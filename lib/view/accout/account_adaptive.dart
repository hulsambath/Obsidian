part of 'account_view.dart';

class AccountAdaptive extends StatefulWidget {
  const AccountAdaptive({super.key});

  @override
  State<AccountAdaptive> createState() => _AccountAdaptiveState();
}

class _AccountAdaptiveState extends State<AccountAdaptive> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Account Screen'),
      ),
    );
  }
}
