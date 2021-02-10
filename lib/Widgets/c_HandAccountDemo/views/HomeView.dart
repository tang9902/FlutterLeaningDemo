import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/common_widgets/Tabs.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/common_widgets/Tools.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/models/AccountRecord.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/Layout.dart';
import 'package:provider/provider.dart';
// 页面主框架
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
        title: '总帐',
        iconData: Icons.account_balance_rounded,
        child:ListView(
          children: [
            TopContainer(),
            Tabs(
              myTabs: [Tab(text: '按帐目',), Tab(text: '按分类',)],
              children: [
                DownContainer(mapListAdapter:AccountRecord.mapListWithAccountTitle),
                DownContainer(mapListAdapter:AccountRecord.mapListWithCourseTitle),
              ],
              tabViewHight: 300,
            )
          ],
        )
    );
  }
}
/*--------------------------------------------------------top part*/
class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TopItem(),
            TopItem(),
          ],
        ),
        Row(
          children: [
            TopItem(),
            TopItem(),
          ],
        )
      ],
    );
  }
}
class TopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SizedBox(
      height: 100,
      child: Card(
        color: Colors.green,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.monetization_on_outlined,color: Colors.white,),
                Text('总支出',style: TextStyle(color: Colors.white),)
              ],
            ),
            Text('10000.00',style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    ));
  }
}

/*--------------------------------------------------------down part*/
typedef List<Map<String, dynamic>> MapListAdapter(List<Map<String, dynamic>> mapList);
class DownContainer extends StatelessWidget {
  final MapListAdapter mapListAdapter;
  const DownContainer({Key key, @required this.mapListAdapter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Consumer<AccountRecord>(
        builder: (context, model, child){
          return FutureBuilder(
              future: model.mapList,
              builder: (context,snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    var mapList = snapshot.data;
                    mapList = mapListAdapter(mapList);
                    return ListView(
                        children:
                        // map应包含字段： (item) => DownItem(key:ValueKey(item['id']),title: item['title'], num: item['amount'], subTitle: item['comment'],)
                        mapList.map<DownItem>(
                                (item) => DownItem(key:ValueKey(item['id']),title: item['title'] , num: item['amount'].toString(), subTitle: item['comment'], dateTime: Tools.formatDate(item['updatedAt'],format: 'M月d日 H时m分'),)
                        ).toList()
                    );
                  }
                }
                return Center(child: CircularProgressIndicator(),);
              }
          );
        },
      ),
    );
  }
}
class DownItem extends StatelessWidget {
  final String title;
  final String num;
  final String subTitle;
  final String dateTime;

  const DownItem({Key key, @required this.title, @required this.num, @required this.subTitle, @required this.dateTime}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.monetization_on_outlined),
      title: Text(title),
      subtitle: Text(dateTime + ' - ' + subTitle),
      trailing: Text(num),
    );
  }
}



