import 'package:flutter/material.dart';

import 'room_tile.dart';

class RoomList extends StatelessWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) {
        return const RoomCard();
      },
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
