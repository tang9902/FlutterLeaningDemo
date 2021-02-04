import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData iconData;

  const Layout({Key key, this.title, this.child, this.iconData}) :
        assert(title!=null),
        assert(child!=null),
        assert(iconData!=null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Icon(iconData),
            Text(title)
          ],),
          actions: [
            FlatButton(onPressed: (){Navigator.pushNamed(context, '/HelpView');}, child: Icon(Icons.help,color: Colors.white,)),
            FlatButton(onPressed: (){Navigator.pushNamed(context, '/LoginView');}, child: Icon(Icons.exit_to_app,color: Colors.white,)),
          ],
        ),
        body: child,
      ),
    );
  }
}
