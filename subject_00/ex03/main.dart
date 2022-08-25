import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'my_widget',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.dark(),
        ),
        home: const SafeArea(child: BlurImage()));
  }
}

class BlurImage extends StatelessWidget {
  const BlurImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String titleImage =
        'https://w.namu.la/s/420422c9668360c3654fb8d4ba4b4921a22a8732d660e08d81cfa5281035aae6573a4f61927aaeecdcf6ee911af6ea5a4aa49bef54be3f63ada78ac5f914e1cfb4b78e644e2190944fb886f2688ffb91';
    String mainImage =
        'https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2021/10/07/.cache/512/20211007320109.jpg';
    return Scaffold(
        body: SafeArea(
      child: Column(children: <Widget>[
        SizedBox(height: 10),
        Stack(children: [
          AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Container(
              child: Image.network(mainImage, fit: BoxFit.fill),
            ),
          ),
          Container(
            color: Colors.black,
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: Image.network(titleImage),
          ),
          Container(
            color: Colors.green,
          ),
          Positioned.fill(
            top: 80,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [0, 0.33, 0.66, 1],
              )),
            ),
          )
        ]),
        Container(
          width: 1000,
          child: Text('title : Squad Game 2021'),
        ),
        Container(
          width: 1000,
          child: Text('Episodes : 1'),
        ),
        Container(
          width: 1000,
          child: Text('Genre : TV Drama'),
        ),
        Container(
          width: 1000,
          child: Text(
              'Plot : Seong Gi-hun, a divorced and indebted chauffeur, is invited to play a series of children\'s games for a chance at a large cash prize. Accepting the offer, he is taken to an unknown location where he finds himself among 456 players who are all deeply in debt. The players are made to wear green tracksults and are kept under watch at all times by masked guards in pink jumpsuits, with the games overseen by the Front Man, who wears a black mask and black uniform'),
        ),
      ]),
    ));
  }
}
