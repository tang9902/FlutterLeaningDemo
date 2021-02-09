import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FormDemo',
        home:Material(
          child: Scaffold(
            appBar: AppBar(title: Text('FormDemo')),
            body: MyForm(),
          ),
        )
    );
  }
}

class MyForm extends StatefulWidget {
  MyForm({Key key}) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            key:ValueKey('email'),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: '请输入邮箱'
            ),
            validator: (value){
              if(value.isEmpty)
                return '邮箱不能为空';
              return null;
            },
            onSaved: (value) {
              print('email.onSaved');
              email = value;
            },
          ),
          TextFormField(
            key: ValueKey('password'),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: '请输入密码'
            ),
            validator: (value){
              if(value.isEmpty)
                return '密码不能为空';
              return null;
            },
            onSaved: (value){
              print('password.onSaved');
              password = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print('验证通过，处理业务');
                  _formKey.currentState.save();
                  setState(() {
                    print(email);
                    print(password);
                  });
                }
              },
              child: Text('提交'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          email.isEmpty ? Text("No data") : Text(email),
          password.isEmpty ? Text("No Data") : Text(password),
        ],
      ),
    );
  }
}




