import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:dept_counter/modules/scheduler.dart';

class DeptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dept Page'),
      ),
      body: DeptItemCardList(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/dept-add-topic-info-page');
        },
        label: const Text('Create'),
      ),
    );
  }
}

class DeptItemCardList extends StatefulWidget {
  const DeptItemCardList({Key? key}) : super(key: key);

  @override
  _DeptItemCardListState createState() => _DeptItemCardListState();
}

class _DeptItemCardListState extends State<DeptItemCardList> {
  String name = 'benz';

  void _updateListView() {
    setState(() {
      name = 'updated!';
    });
  }

  Widget _buildDeptListView() {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider();

        return _buildDeptCard();
      },
    );
  }

  Widget _buildDeptCard() {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => DeptPage()));
        },
        splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // // return _buildDeptListView();
    // return Consumer<Scheduler>(
    //   builder: (context, scheduler, _) => Container(
    //     child: Text('555'),
    //   ),
    // );

    return Container(
      child: Text('$name'),
    );
  }
}
