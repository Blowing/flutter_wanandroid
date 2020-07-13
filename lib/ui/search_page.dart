
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索'),
      ),
      
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search),
          onPressed: () {}),
    );
  }

}