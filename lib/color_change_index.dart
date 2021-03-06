import 'package:color_index/color.dart';
import 'package:flutter/material.dart';

import 'color_home.dart';

class ColorChange extends StatefulWidget {
  ColorChange({Key? key, required this.colorClass}) : super(key: key);
  ColorClass colorClass;

  @override
  _ColorChangeState createState() => _ColorChangeState();
}

List<Color> colorList = [Colors.redAccent, Colors.yellow, Colors.green];
int selectIndex = 0;
String helloText = "안녕";

class _ColorChangeState extends State<ColorChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(widget.colorClass);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colorList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                      widget.colorClass.colorSelectIndex = selectIndex;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: selectIndex == index
                            ? BorderRadius.circular(30)
                            : BorderRadius.circular(0),
                        color: colorList[index],
                      ),
                      width: 200,
                      height: 200,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
