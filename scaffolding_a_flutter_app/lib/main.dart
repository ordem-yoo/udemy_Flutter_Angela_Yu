import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('I Am Rich'),
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://mblogthumb-phinf.pstatic.net/MjAyMTA5MTJfMjg2/MDAxNjMxNDMzMTI0Nzc2._DYz95JIf91jK2dKUcsL5Zyq6Hb7HIv1sBa0M_Kbt-og.Bssne2mHN5Zyd_38sHHUClnkxG_t54TANWhGpgsy3DUg.PNG.ioimmmmmm/1.png?type=w800'),
          ),
        ),
      ),
    ),
  );
}
