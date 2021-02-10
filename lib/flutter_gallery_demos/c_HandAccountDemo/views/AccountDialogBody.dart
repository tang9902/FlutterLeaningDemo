import 'package:flutter/material.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/common_widgets/CustomDropDown.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/db/SQLiteDB.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/models/AccountRecord.dart';
import 'package:flutter_app/Widgets/c_HandAccountDemo/views/Layout.dart';
import 'package:provider/provider.dart';

// 页面主框架
class AccountDialogBody extends StatefulWidget {
  AccountDialogBody({Key key}) : super(key: key);
  @override
  _AccountDialogBodyState createState() => _AccountDialogBodyState();
}

class _AccountDialogBodyState extends State<AccountDialogBody> {
  final _formKey = GlobalKey<FormState>();
  AccountRecord accountRecord;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accountRecord = AccountRecord(accountId: 1,courseId: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 1000,
      margin: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            CustomDropDown(initValue:accountRecord.courseId,key:ValueKey('courseName'),options: {1:'现金',2:'借记卡',3:'信用卡'}, onChangedCallBack: (int newValue) { accountRecord.courseId = newValue; },),
            CustomDropDown(initValue:accountRecord.accountId,key:ValueKey('accountName'),options: {1:'交通费用',2:'通迅费用',3:'餐饮费用'}, onChangedCallBack: (int newValue) { accountRecord.accountId = newValue; },),
            TextFormField(
              key:ValueKey('amount'),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: '请输入金额'
              ),
              validator: (value){
                if(value.isEmpty)
                  return '金额不能为空';
                if(double.parse(value, (e) => null) == null){
                  return '必须为数字';
                }
                return null;
              },
              onChanged: (value){
                // tony!!! 此前方法写错，导致onChanged不执行。
                // 错误写法 ： accountRecord.amount = value as double;
                accountRecord.amount = double.parse(value,(e)=>null);
              },
              // onSaved: (value) {
              //   accountRecord.amount = double.parse(value);
              // },
            ),
            TextFormField(
              key:ValueKey('comment'),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  hintText: '请输入备注'
              ),
              validator: (value){
                if(value.isEmpty)
                  return '备注不能为空';
                return null;
              },
              onChanged: (value) {
                accountRecord.comment = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  // _formKey.currentState.save();
                  print('验证通过，处理业务');
                  accountRecord.updatedAt = accountRecord.createdAt = DateTime.now().millisecondsSinceEpoch;
                  print(accountRecord.toMap());
                  SQLiteDB.getInstance().then((db) {
                    db.insert('account_record', accountRecord.toMap()).then((value){
                      final _model = Provider.of<AccountRecord>(context, listen: false);
                      _model.fetchMapListAndNotify();
                      Navigator.pop(context);
                    });
                  }
                  );

                }else {
                  print('难不通过');
                  print(accountRecord.toMap());
                }
              },
              child: Text('提交'),
            ),
          ],
        ),
      ),
    );
  }
}



