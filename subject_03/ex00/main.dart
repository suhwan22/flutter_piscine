import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'limitless',
      home: GridPage(),
    );
  }
}

class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  List<Map<String, String>> movieData = [
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1Lh9LER4xRQ3INFFi2dfS2hpRwv.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/oF80bdLeRri6PFm0yAT0gRNQoDG.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/8SAWREjfLyArr2pYo1gHihCthY8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/aNtAP8ZzUMdnCPoqYgVOcgI0Eh4.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yXNVcG0C7Oymg9F9ecXa9MWVwj8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/68ZwnPALUeweaFdT1z75oXJ4Xie.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/l8HyObVj8fPrzacAPtGWWLDhcfh.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/bZrStEjqKMRCywomPZiPkOWZpXL.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/qfB6QNaCtmGDy9ujvBOUs7UaPx.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/eRLlrhbdYE7XN6VtcZKy6o2BsOw.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/52SgH0kLiSpWdJDOZvhAyy34uhe.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yjdOpEtlzlAnw4Kw0NGw25VrbIb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xs7Dx72wr2H14uxu0H0R9ljDZk7.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/zPDY58lk0YIxr9qsnGV64PEnjkI.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/pMyOSRURkxF6YId9vOTGsBH1jRb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/jlmuSzTXOppShgYZbeetWTFTi6P.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xJY3ttefDnnn6doYQo5QOROgdvV.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/w7PJ7fBEYOuaAMKfYa4zmw45v3N.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/AviYDX3NuuyVQdZoLmLxNKp3zm8.jpg>'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Movie Poster',
            style: TextStyle(fontFamily: 'Fruktur'),
          ),
          backgroundColor: Colors.green,
        ),
        //GridView위에 다른 위젯 추가를 어떻게하지??
        body: GridView.builder(
            itemCount: movieData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: EdgeInsets.all(5),
                  child: Image.network(
                    movieData.elementAt(index).values.toString().substring(
                        2,
                        movieData.elementAt(index).values.toString().length -
                            2),
                    fit: BoxFit.cover,
                  ));
            }));
  }
}
