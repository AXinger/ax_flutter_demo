import 'dart:html';
import 'dart:ui';

import 'package:ax_flutter_util/ax_flutter_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_data_notifier.dart';

class P01MaterialPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPage();
  }
}

class _MyPage extends State<P01MaterialPage2> {
  @override
  Widget build(BuildContext context) {
    Color _foregroundColor(Set<MaterialState> states) {
//      const Set<MaterialState> interactiveStates = <MaterialState>{
//        ///按下
//        MaterialState.pressed,
//        ///徘徊 应该是长按
//        MaterialState.hovered,
//        /// 集中
//        MaterialState.focused,
//        MaterialState.selected,
//      };
//
//      if (states == MaterialState.pressed) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.hovered) {
//        return Colors.orange;
//      }
//      if (states == MaterialState.selected) {
//        return Colors.purple;
//      }
//      if (states.any(interactiveStates.contains)) {
//        return Colors.blue;
//      }
//      return Colors.red;

      if (states.contains(MaterialState.pressed)) {
        return Colors.orange;
      }
      if (states.contains(MaterialState.disabled)) {
        return Colors.grey;
      }
      if (states.contains(MaterialState.selected)) {
        return Colors.purple;
      }
      return Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('形状'),
        actions: <Widget>[
          FlatButton(
            color: Colors.orange,
            child: Text('改变主题色'),
            onPressed: () {
              showCupertinoSheet(
                context: context,
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: Text('蓝色'),
                    onPressed: () {
                      Navigator.pop(context);
//                      mainConfigModel.themeData = Theme.of(context).copyWith(
//                        primaryColor: Colors.lightBlue,
//                      );
                      Provider.of<ThemeDataNotifier>(context, listen: false)
                          .themeData = Theme.of(context).copyWith(
                        primaryColor: Colors.lightBlue,
                      );
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('红色'),
                    onPressed: () {
                      Navigator.pop(context);
//                      mainConfigModel.themeData = Theme.of(context).copyWith(
//                        primaryColor: Colors.red,
//                      );

                      Provider.of<ThemeDataNotifier>(context, listen: false)
                          .themeData = Theme.of(context).copyWith(
                        primaryColor: Colors.red,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: Colors.red),
            Text('Table 表格'),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Table(
//                border: TableBorder(
//                  top: BorderSide(color: Colors.red),
//                  left: BorderSide(color: Colors.red),
//                  right: BorderSide(color: Colors.red),
//                  bottom: BorderSide(color: Colors.red),
//                  horizontalInside: BorderSide(color: Colors.red),
//                  verticalInside: BorderSide(color: Colors.green),
//                ),
                border: TableBorder.all(color: Colors.red),

                children: [
                  TableRow(
//                    decoration: BoxDecoration(
////                      color: Colors.orange,
//                    ),
                    children: [
                      TableCell(child: Text('姓名', textAlign: TextAlign.center)),
                      TableCell(child: Text('性别', textAlign: TextAlign.center)),
                      TableCell(child: Text('年龄', textAlign: TextAlign.center)),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('老孟', textAlign: TextAlign.center)),
                      TableCell(child: Text('男', textAlign: TextAlign.center)),
                      TableCell(child: Text('18', textAlign: TextAlign.center)),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(child: Text('小红')),
                      TableCell(child: Text('女')),
                      TableCell(child: Text('18')),
                    ],
                  ),
                ],
              ),
            ),

            Divider(color: Colors.red),
            Text('NotificationListener,必须包裹 Builder'),
            NotificationListener<CustomNotification>(
              onNotification: (CustomNotification notification) {
                print('介绍事件——2：${notification.value}');
                return true;
              },
              child: Builder(
                builder: (context) {
                  return RaisedButton(
                    child: Text('发送'),
                    onPressed: () {
                      CustomNotification('自定义事件').dispatch(context);
                    },
                  );
                },
              ),
            ),
            Divider(color: Colors.red),
            Text('RotatedBox 旋转'),
            RotatedBox(
              quarterTurns: 3, //旋转90度(1/4圈)
              child: Text("Hello world"),
            ),
            Divider(color: Colors.red),
            Text('TextButton,代替 FlatButton'),
            TextButton(
              onPressed: () {},
              child: Text('TextButton'),
              style: ButtonStyle(
                /// foregroundColor 文字颜色
//                  foregroundColor: MaterialStateColor.resolveWith(getColor),
                foregroundColor:
                    MaterialStateColor.resolveWith(_foregroundColor),
              ),
            ),
            FlatButton(onPressed: () {}, child: Text('FlatButton')),

            Text('ElevatedButton,代替 RaisedButton'),

            Text('OutlinedButton,代替 OutlineButton ,多个d'),
            Divider(color: Colors.red),
            Text('IntrinsicHeight 子无Height 右父约束'),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(color: Colors.blue, width: 50.0),
                  Container(color: Colors.red, width: 50.0, height: 100.0),
                  Container(color: Colors.yellow, width: 150.0),
                ],
              ),
            ),
            Divider(color: Colors.red),
            Text('IntrinsicWidth 子无Width 右父约束'),
            IntrinsicWidth(
//              stepHeight: 450.0,
              stepWidth: 300.0,
              child: Column(
                children: <Widget>[
                  Container(color: Colors.blue, height: 100.0),
                  Container(color: Colors.red, width: 150.0, height: 100.0),
                  Container(color: Colors.yellow, height: 150.0),
                ],
              ),
            ),

            Divider(color: Colors.red),
            Text('FractionallySizedBox 比如当前按钮的宽度占父组件的70%'),
            FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.centerLeft,
              child: Container(
                color: Colors.yellow,
                height: 30,
              ),
            ),
            Divider(color: Colors.red),
            Text(
                'LinearProgressIndicator进度条 如果 value 为 null 或空，则显示一个动画，否则显示一个定值。Progress 的值只能设置 0 ~ 1.0，如果大于 1，则表示已经结束。'),
            LinearProgressIndicator(
//              value:null,
              backgroundColor: Colors.orange,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Divider(color: Colors.red),
            Text('CircularProgressIndicator'),
            CircularProgressIndicator(
//              value:null,
              backgroundColor: Colors.greenAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            Divider(color: Colors.red),
            Text('CupertinoActivityIndicator'),
            CupertinoActivityIndicator(
              radius: 30,
            ),
            Divider(color: Colors.red),
            Text('RefreshProgressIndicator'),
            RefreshProgressIndicator(
//              value: 0.1,
              backgroundColor: Colors.greenAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
              strokeWidth: 2.0,
              semanticsLabel: 'semanticsLabel',
              semanticsValue: 'semanticsValue',
            ),
            Divider(color: Colors.red),
            Text('MaterialBanner'),
            MaterialBanner(
              backgroundColor: Colors.orange,
              leading: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
              leadingPadding: EdgeInsets.all(5),
              content: Text('老孟'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {},
                )
              ],
            ),

            Divider(color: Colors.red),
            Text('ModalBarrier是一个静态蒙层控件，ModalRoute控件就是间接使用的此控件，此控件有点击属性，点击会调用'),
            Container(
              height: 100,
              width: 100,
//              color: Colors.red,
              child: ModalBarrier(
                color: Colors.orange.withOpacity(0.1),
              ),
            ),

            Divider(color: Colors.red),
            Text('CalendarDatePicker'),
            CalendarDatePicker(
              initialCalendarMode: DatePickerMode.day,
              initialDate: DateTime(2020, 5, 3),
              firstDate: DateTime(2020, 5, 1),
              lastDate: DateTime(2099, 5, 31),
              onDateChanged: (value) {},
            ),
            Divider(color: Colors.red),
            Text('NavigationToolbar是一个布局控件'),

            Divider(color: Colors.red),
            Text('child 在 FittedBox范围内，尽可能大'),
            Container(
              color: Colors.grey,
              width: 300,
//              height: 250,

              //缩放布局
              child: FittedBox(
                fit: BoxFit.contain,
                //对亲属性
                alignment: Alignment.center,

                child: Container(
                  color: Colors.lightBlue,
                  child: Text('还有谁'),
                ),
              ),
            ),
            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(100)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BeveledRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.red),
                  borderRadius: BorderRadius.circular(0)),
              child: Text('BeveledRectangleBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: Border(top: BorderSide(color: Colors.red, width: 2)),
              child: Text('Border'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: Border(
                top: BorderSide(color: Colors.red, width: 10),
                right: BorderSide(color: Colors.blue, width: 10),
                bottom: BorderSide(color: Colors.yellow, width: 10),
                left: BorderSide(color: Colors.green, width: 10),
              ),
              child: Text('Border'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: BorderDirectional(
                start: BorderSide(color: Colors.red, width: 2),
                end: BorderSide(color: Colors.blue, width: 2),
              ),
              child: Text('BorderDirectional'),
              onPressed: () {},
            ),
            Container(
              height: 100.0,
              width: 100.0,

              /// 前台装修
              ///将BoxDecoration设置为foregroundDecoration，它绘制在Container的子项之上（而装饰是在子项后面绘制的）。
              foregroundDecoration: BoxDecoration(
                backgroundBlendMode: BlendMode.exclusion,
                gradient: LinearGradient(
                  colors: const [
                    Colors.red,
                    Colors.blue,
                  ],
                ),
              ),
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.exclusion,
                gradient: LinearGradient(
                  colors: const [
                    Colors.red,
                    Colors.blue,
                  ],
                ),
              ),
              child: Text('foregroundDecoration'),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: RaisedButton(
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                child: Text('圆边'),
                onPressed: () {},
              ),
            ),
            RaisedButton(
              shape: ContinuousRectangleBorder(
                  side: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('ContinuousRectangleBorder'),
              onPressed: () {},
            ),
            Container(
              width: 200,
              height: 100,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20)),
                child: Text('RoundedRectangleBorder'),
                onPressed: () {},
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: RaisedButton(
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.red),
                ),
                child: Container(
                  color: Colors.red,
                  child: Text(
                    '圆边',
                    textAlign: TextAlign.center,
                  ),
                ),
                onPressed: () {},
              ),
            ),

            RaisedButton(
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('OutlineInputBorder'),
              onPressed: () {},
            ),

            RaisedButton(
              shape: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              child: Text('UnderlineInputBorder'),
              onPressed: () {},
            ),
            /**
             * ClipRect组件使用矩形裁剪子组件，通常情况下，
             * ClipRect作用于CustomPaint 、 CustomSingleChildLayout 、 CustomMultiChildLayout 、
             * Align 、 Center 、 OverflowBox 、 SizedOverflowBox组件，
             * 例如ClipRect作用于Align，可以仅显示上半部分
             *
             * clipper参数定义裁剪规则，下面具体介绍。

                clipBehavior参数定义了裁剪的方式，只有子控件超出父控件的范围才有裁剪的说法，各个方式说明如下：

                none：不裁剪，系统默认值，如果子组件不超出边界，此值没有任何性能消耗。
                hardEdge：裁剪但不应用抗锯齿，速度比none慢一点，但比其他方式快。
                antiAlias：裁剪而且抗锯齿，此方式看起来更平滑，比antiAliasWithSaveLayer快，比hardEdge慢，通常用于处理圆形和弧形裁剪。
                antiAliasWithSaveLayer：裁剪、抗锯齿而且有一个缓冲区，此方式很慢，用到的情况比较少。

             * */
            ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: Container(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/image/1000x1000.png',
                      fit: BoxFit.cover),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: 150,
                child: Image.asset(
                  'assets/image/1000x1000.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            /// ClipPath组件根据路径进行裁剪，我们自定义裁剪路径也可以使用系统提供的，
            ClipPath.shape(
              shape: StadiumBorder(),
              child: Container(
                height: 150,
                width: 250,
                child: Image.asset(
                  'assets/image/1000x1000.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  CustomNotification(this.value);

  final String value;
}
