import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'HeroDemo',
        home:HeroAnimation()
    );
  }
}

class PhotoHero  extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 3.0; // 1.0 means normal animation speed.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'assets/2.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context).push(getPageRoute(getPage01));
          },
        ),
      ),
    );
  }
}

MaterialPageRoute<void> getPageRoute(Function pageGetter){
  return MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return pageGetter(context);
      }
  );
}

Widget getPage01(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: const Text('Page01'),
    ),
    body: Container(
      // Set background to blue to emphasize that it's a new route.
      color: Colors.lightBlueAccent,
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topLeft,
      child: PhotoHero(
        photo: 'assets/2.jpg',
        width: 100.0,
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
