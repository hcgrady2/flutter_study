import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/sliverbar/TextFieldWidget.dart';
import 'package:flutter_demo/sliverbar/SliverAppBar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class MySliverBar extends StatefulWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp();
  }
  _MySliverBarState createState()=>_MySliverBarState();

}
class _MySliverBarState extends State<MySliverBar>
{
  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      title: new TextFieldWidget(),
      backgroundColor: SliverBar.color,
      leading: MaterialButton(child:Text("全选",style: TextStyle(color:  Colors.red),), padding: EdgeInsets.all(10),
          colorBrightness: Brightness.light,onPressed: _onPressed,height: 20,),
      /**
       * 如果没有leading，automaticallyImplyLeading为true，就会默认返回箭头
       * 如果 没有leading 且为false，空间留给title
       * 如果有leading，这个参数就无效了
       */
      automaticallyImplyLeading: true,
      expandedHeight: 200.0, //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
      elevation: 4, //阴影的高度
      forceElevated: true, //是否显示阴影
      pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
      snap: false, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          tooltip: '菜单选项',
          onPressed: _onPressed,
        ),
      ],
      flexibleSpace:  FlexibleSpaceBar(
//title: new Text("随内容一起滑动的头部"),
//centerTitle: true,
//collapseMode: CollapseMode.pin,
          background: Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Swiper(
                itemBuilder: _swiperBuilder,
                itemCount: 5,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.deepOrange,
                      activeColor: Colors.white,
                    )),
                //control: new SwiperControl(),//出现手动选择的左右按钮
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap: (index) => print('点击了第$index个'),
              )),
      ),
    );
  }
  Widget _swiperBuilder(BuildContext context, int index) {


  //  print(index);

    if(index == 0){
      return (Image.network(
        "http://www.pptok.com/wp-content/uploads/2012/08/xunguang-4.jpg",
        fit: BoxFit.fill,
      ));
    }else if(index == 1){
      return (Image.network(
        "http://pic3.nipic.com/20090527/1242397_102231006_2.jpg",
        fit: BoxFit.fill,
      ));
    }else if(index == 2){
      return (Image.network(
        "http://pic29.nipic.com/20130601/12122227_123051482000_2.jpg",
        fit: BoxFit.fill,
      ));
    }else if(index == 3){
      return (Image.network(
        "http://img3.redocn.com/tupian/20150318/shengdanquanbiankuangsucai_4020876.jpg",
        fit: BoxFit.fill,
      ));
    }else if(index == 4){
      return (Image.network(
        "http://pic3.nipic.com/20090701/1242397_161620025_2.jpg",
        fit: BoxFit.fill,
      ));
    }



  }
  void _onPressed() {}
}


