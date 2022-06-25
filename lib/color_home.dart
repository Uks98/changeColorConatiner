import 'package:color_index/color.dart';
import 'package:color_index/color_change_index.dart';
import 'package:flutter/material.dart';


class ColorHome extends StatefulWidget {
   ColorHome({Key? key}) : super(key: key);

  @override
  _ColorHomeState createState() => _ColorHomeState();

}
 List<String> textList = ["hello","world","pipi"];
 List<Color> _colorList = [Colors.redAccent,Colors.yellow,Colors.green];
 ColorClass? colorClass;
class _ColorHomeState extends State<ColorHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          colorClass = await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ColorChange(
            colorClass: ColorClass(
              colorSelectIndex: 0
            ))));
               print("인덱스 ${colorClass!.colorSelectIndex}");
          setState(() {});
          },),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Expanded(child: ListView.builder(
              itemCount: textList.length,
              itemBuilder:(context,index){
                return Container(
                  color:_colorList[colorClass!.colorSelectIndex],
                  child: Text(textList[index]),
                );
              } ))
        ],
      ),
    );
  }
}
