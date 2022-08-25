import 'package:flutter/material.dart';

class Poketmon {
  final String name;
  final int level;
  final String imageURL;
  final List<String> skills;

  Poketmon({
    required this.name,
    required this.level,
    required this.imageURL,
    required this.skills,
  });
}

class PoketmonDetails extends StatelessWidget {
  final Poketmon poketmon;

  const PoketmonDetails({Key? key, required this.poketmon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(poketmon.imageURL),
            ),
          ),
          const Divider(
            height: 30,
            thickness: 1,
            endIndent: 30.0,
            color: Colors.grey,
          ),
          const Text(
            'Name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          Text(
            '${poketmon.name}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w400),
          ),
          Text(
            'Level',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          Text(
            'Lv.${poketmon.level}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 45.0,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                '${poketmon.skills[0]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                '${poketmon.skills[1]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10,
              ),
              Text(
                '${poketmon.skills[2]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
