### 布局类 Widget 
布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；
#### 分类
+ LeafRenderObjectWidget : 叶子节点。如，Text，Image
+ SingleChildRenderObjectWidget : 只有一个子节点。如 ConstrainedBox，DecoratedBox。
+ MultiChildRenderObjectWidget : 包含多个 Widget，如 Row，Column,Stack 。

#### 线性布局 Row 和 Column
MainAxisAlignment 与 CrossAxisAlignment 分别代表主轴对齐与纵轴对齐。

#### Row
textDirection: 水平方向文字顺序
MainAxisSize : Row 在水平方向占用的空间大小，(MainAxisSize.max: 最大，MainAxisSize.min 最小)
MainAxisAlignment: 子 widget 水平方向对齐方式，左对齐，右对齐，还是居中对齐。
VerticalDirection: Row 排列是，垂直方向对齐方式，VerticalDirection.down表示 下对齐。
CrossAxisAlignment：表示子Widgets在纵轴方向的对齐方式 VerticalDirection.down时crossAxisAlignment.start指顶部对齐，verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
children ：子Widgets数组。


#### 弹性布局 Flex

Flex 参数和 Column 与 Row  基本相同，其他参数：
@required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向 List<Widget> children = const <Widget>[],
Flex 中一般包含 Expanded 来进行比例设置。



#### 流式布局
流式布局：
Wrap： 可以看做是可以换行的 row

参数：
spacing：主轴方向子widget的间距
runSpacing：纵轴方向的间距
runAlignment：纵轴方向的对齐方式


#### 层叠布局
Flutter中使用Stack和Positioned来实现绝对定位，Stack允许子widget堆叠，而Positioned可以给子widget定位（根据Stack的四个角）。
fit: StackFit.expand, //未定位widget占满Stack整个空间


### 容器类 Widget
而容器类Widget一般只需要接受一个子Widget（child），他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。

#### Padding
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Padding
```
padding 使用  EdgeInsets 来确定留白。
+ fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白。
+ all(double value) : 所有方向均使用相同数值的补白。
+ only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。
+ symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。

也就是 padding 只有一个子元素，通过 EdgeInsets 来确定 padding 。

#### Align
都是当做控件的属性来用，设置child的对齐方式，例如居中、居左居右等，并根据child尺寸调节自身尺寸。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Align
```
示例：
```text
new Align(
  alignment: Alignment.center,
  widthFactor: 2.0,
  heightFactor: 2.0,
  child: new Text("Align"),
)
```
设置一个宽高为child两倍区域的Align，其child处在正中间。




#### ConstrainedBox 
这个控件的作用是添加额外的限制条件（constraints）到child上 。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > ConstrainedBox
```

ConstrainedBox
ConstrainedBox用于对齐子widget（所有）添加额外的约束

如:
```text
  ConstrainedBox(
        constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大
        minHeight: 50.0 //最小高度为50像素
        ),
        child: Container(
        height: 5.0,
        child: redBox
        ),
        )
```
示例:
```text
new ConstrainedBox(
  constraints: const BoxConstraints(
    minWidth: 100.0,
    minHeight: 100.0,
    maxWidth: 150.0,
    maxHeight: 150.0,
  ),
  child: new Container(
    width: 200.0,
    height: 200.0,
    color: Colors.red,
  ),
);

```



#### FittedBox
它主要做了两件事情，缩放（Scale）以及位置调整（Position）。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > FittedBox
```
示例
```text
new Container(
  color: Colors.amberAccent,
  width: 300.0,
  height: 300.0,
  child: new FittedBox(
    fit: BoxFit.contain,
    alignment: Alignment.topLeft,
    child: new Container(
      color: Colors.red,
      child: new Text("FittedBox"),
    ),
  ),
)
```

#### AspectRatio
AspectRatio的作用是调整child到设置的宽高比。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > AspectRatio
```
示例
```text
    return new Container(
      height: 200.0,
      child: new AspectRatio(
        aspectRatio: 1,
        child: new Container(
          color: Colors.red,
        ),
      ),
    );
```

#### SizedBox
继承关系：
```text
Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > SizedBox
```

布局行为：
+ child不为null时，如果设置了宽高，则会强制把child尺寸调到此宽高；如果没有设置宽高，则会根据child尺寸进行调整；
+ child为null时，如果设置了宽高，则自身尺寸调整到此宽高值，如果没设置，则尺寸为0；

SizedBox用于给子widget指定固定的宽高，如：

```text
SizedBox(
width: 80.0,
height: 80.0,
child: redBox
)

```

示例：
```text
 Container(
      color: Colors.green,
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 300.0,
        height: 200.0,
        child: Container(
          color: Colors.red,
          width: 50.0,
          height: 50.0,
        ),
      ),
    );
```
注：如果有多重限制，取最大值







#### DecoratedBox
DecoratedBox可以在其子widget绘制前(或后)绘制一个装饰Decoration（如背景、边框、渐变等）。
    
const DecoratedBox({
  Decoration decoration,
  DecorationPosition position = DecorationPosition.background,
  Widget child
})

decoration：代表将要绘制的装饰，它类型为Decoration，Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。
position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类两个值：
background：在子widget之后绘制，即背景装饰。
foreground：在子widget之上绘制，即前景。

#### BoxDecoration
BoxDecoration({
  Color color, //颜色
  DecorationImage image,//图片
  BoxBorder border, //边框
  BorderRadiusGeometry borderRadius, //圆角
  List<BoxShadow> boxShadow, //阴影,可以指定多个
  Gradient gradient, //渐变
  BlendMode backgroundBlendMode, //背景混合模式
  BoxShape shape = BoxShape.rectangle, //形状
})

#### Transform 变换（绘制阶段）
绕轴旋转：
```text
Container(
  color: Colors.black,
  child: new Transform(
    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
    transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
    child: new Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.deepOrange,
      child: const Text('Apartment for rent!'),
    ),
  ),
);

```

平移：
```text
DecoratedBox(
  decoration:BoxDecoration(color: Colors.red),
  //默认原点为左上角，左移20像素，向上平移5像素  
  child: Transform.translate(offset: Offset(-20.0, -5.0),
    child: Text("Hello world"),
  ),
)
```

旋转：
```text
    ecoratedBox(
      decoration:BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle:math.pi/2 ,
        child: Text("Hello world"),
      ),
    )；
```

缩放：
```text

DecoratedBox(
  decoration:BoxDecoration(color: Colors.red),
  child: Transform.scale(
      scale: 1.5, //放大到1.5倍
      child: Text("Hello world")
  )
);
```


#### RotatedBox (布局阶段)
```text
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //将Transform.rotate换成RotatedBox  
      child: RotatedBox(
        quarterTurns: 1, //旋转90度(1/4圈)
        child: Text("Hello world"),
      ),
    ),
    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
  ],
),
```


#### Container
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > Container
```
它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。
定义：
```text
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})
```
平时比较常用：padding、color、width、height、margin属性。

示例：
```text
Container(
  margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外补白
  constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
  decoration: BoxDecoration(//背景装饰
      gradient: RadialGradient( //背景径向渐变
          colors: [Colors.red, Colors.orange],
          center: Alignment.topLeft,
          radius: .98
      ),
      boxShadow: [ //卡片阴影
        BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0
        )
      ]
  ),
  transform: Matrix4.rotationZ(.2), //卡片倾斜变换
  alignment: Alignment.center, //卡片内文字居中
  child: Text( //卡片文字
    "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
  ),
);
```

#### Baseline
主要用来文字排版
继承关系
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Baseline
```
布局行为：
Baseline控件布局行为分为两种情况：
+ 如果child有baseline，则根据child的baseline属性，调整child的位置；
+ 如果child没有baseline，则根据child的bottom，来调整child的位置。

示例：
```text
new Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    new Baseline(
      baseline: 50.0,
      baselineType: TextBaseline.alphabetic,
      child: new Text(
        'TjTjTj',
        style: new TextStyle(
          fontSize: 20.0,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
    ),
    new Baseline(
      baseline: 50.0,
      baselineType: TextBaseline.alphabetic,
      child: new Container(
        width: 30.0,
        height: 30.0,
        color: Colors.red,
      ),
    ),
    new Baseline(
      baseline: 50.0,
      baselineType: TextBaseline.alphabetic,
      child: new Text(
        'RyRyRy',
        style: new TextStyle(
          fontSize: 35.0,
          textBaseline: TextBaseline.alphabetic,
        ),
      ),
    ),
  ],
)

```


#### FractionallySizedBox
FractionallySizedBox控件会根据现有空间，来调整child的尺寸，所以说child就算设置了具体的尺寸数值，也不起作用。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > FractionallySizedBox
```
布局行为：
+ 当设置了具体的宽高因子，具体的宽高则根据现有空间宽高 * 因子，有可能会超出父控件的范围，当宽高因子大于1的时候；
+ 当没有设置宽高因子，则填满可用区域；

示例：
```text
new Container(
        color: Colors.blue,
        height: 150.0,
        width: 150.0,
        padding: const EdgeInsets.all(10.0),
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 1.5,
          heightFactor: 1.5,
          child: new Container(
            color: Colors.red,
          ),
        ),
      ),
```

#### LimitedBox
LimitedBox是将child限制在其设定的最大宽高.
继承关系
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > LimitedBox
```

示例：
```text
 Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 100.0,
        ),
        LimitedBox(
          maxWidth: 150.0,
          child: Container(
            color: Colors.blue,
            width: 250.0,
          ),
        ),
      ],
    );
```

#### Offstage
通过一个参数决定一个控件是否显示

继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > Offstage
```

布局行为：
Offstage的布局行为完全取决于其offstage参数
+ 当offstage为true，当前控件不会被绘制在屏幕上，不会响应点击事件，也不会占用空间；
+ 当offstage为false，当前控件则跟平常用的控件一样渲染绘制；


示例：
```text
Column(
  children: <Widget>[
    new Offstage(
      offstage: offstage,
      child: Container(color: Colors.blue, height: 100.0),
    ),
    new CupertinoButton(
      child: Text("点击切换显示"),
      onPressed: () {
        setState(() {
          offstage = !offstage;
        });
      },
    ),
  ],
)

```


#### OverflowBox
OverflowBox这个控件，允许child超出parent的范围显示
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > OverflowBox
```

布局行为：
当OverflowBox的最大尺寸大于child的时候，child可以完整显示，当其小于child的时候，则以最大尺寸为基准，当然，这个尺寸都是可以突破父节点的。最后加上对齐方式，完成布局。

示例：
```text
 Container(
      color: Colors.green,
      width: 200.0,
      height: 200.0,
      padding: const EdgeInsets.all(5.0),
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: 500.0,
        maxHeight: 500.0,
        minWidth: 250.0,
        minHeight: 250.0,
        child: Container(
          color: Color(0x33FF00FF),
          width: 500.0,
          height: 500.0,
        ),
      ),
    );
```




#### SizedOverflowBox
SizedOverflowBox是SizedBox与OverflowBox的结合体。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > SizedOverflowBox
```

布局行为：
+ 尺寸部分。通过将自身的固定尺寸，传递给child，来达到控制child尺寸的目的；
+ 超出部分。可以突破父节点尺寸的限制，超出部分也可以被渲染显示，与OverflowBox类似。

示例代码：
```text
Container(
      color: Colors.green,
      alignment: Alignment.topRight,
      width: 200.0,
      height: 200.0,
      padding: EdgeInsets.all(5.0),
      child: SizedOverflowBox(
        size: Size(20.0, 300.0),
        child: Container(color: Colors.red, width: 200.0, height: 200.0),
      ),
    );
```

#### CustomSingleChildLayout
CustomSingleChildLayout提供了一个控制child布局的delegate，这个delegate可以控制这些因素：
+ 可以控制child的布局constraints；
+ 可以控制child的位置；
+ 在parent的尺寸不依赖于child的情况下，可以决定parent的尺寸。

继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > SingleChildRenderObjectWidget > CustomSingleChildLayout
```




#### SingleChildScrollView
只能有一个可滚动 widget
```text
class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column( 
            //动态创建一个List<Widget>  
            children: str.split("") 
                //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(c, textScaleFactor: 2.0,)) 
                .toList(),
          ),
        ),
      ),
    );
  }
}
```


#### ListView
沿线性方向排列所有 widget
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > StatelessWidget > ScrollView > BoxScrollView > ListView
```


```text
ListView({
  ...  
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数  
  double itemExtent,
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
```

ListView 两种使用方式：

ListView(
shrinkWrap: true,
padding: const EdgeInsets.all(20.0),
children: <Widget>[
const Text('I\'m dedicating every day to you'),
const Text('Domestic life was never quite my style'),
const Text('When you smile, you knock me out, I fall apart'),
const Text('And I thought I was so smart'),
],
);

ListView.builder:
```text
ListView.builder({
// ListView公共参数已省略
...
@required IndexedWidgetBuilder itemBuilder,
int itemCount,
...
})
```




### 多节点布局
#### Table
表格的每一行的高度，由其内容决定，每一列的宽度，则由columnWidths属性单独控制。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > Table
```
示例：
```text
const <TableRow>[
        TableRow(
          children: <Widget>[
            Text('A1'),
            Text('B1'),
            Text('C1'),
            Text('D1'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A2'),
            Text('B2'),
            Text('C2'),
            Text('D2'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A3'),
            Text('B3'),
            Text('C3'),
            Text('D3'),
          ],
        ),
      ],
    );
```
#### wrap
Flow可以很轻易的实现Wrap的效果，但是Wrap更多的是在使用了Flex中的一些概念，某种意义上说是跟Row、Column更加相似的。
单行的Wrap跟Row表现几乎一致，单列的Wrap则跟Row表现几乎一致。但Row与Column都是单行单列的，Wrap则突破了这个限制，mainAxis上空间不足时，则向crossAxis上去扩展显示。
从效率上讲，Flow肯定会比Wrap高，但是Wrap使用起来会方便一些。

继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > Wrap
```

示例
```text
Wrap(
  spacing: 8.0, // gap between adjacent chips
  runSpacing: 4.0, // gap between lines
  children: <Widget>[
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900, child: new Text('AH', style: TextStyle(fontSize: 10.0),)),
      label: Text('Hamilton'),
    ),
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900, child: new Text('ML', style: TextStyle(fontSize: 10.0),)),
      label: Text('Lafayette'),
    ),
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900, child: new Text('HM', style: TextStyle(fontSize: 10.0),)),
      label: Text('Mulligan'),
    ),
    Chip(
      avatar: CircleAvatar(
          backgroundColor: Colors.blue.shade900, child: new Text('JL', style: TextStyle(fontSize: 10.0),)),
      label: Text('Laurens'),
    ),
  ],
)

```


#### ListBody
ListBody是一个不常直接使用的控件，一般都会配合ListView或者Column等控件使用。ListBody的作用是按给定的轴方向，按照顺序排列子节点。
布局行为：
+ 在主轴上，子节点按照顺序进行布局，在交叉轴上，子节点尺寸会被拉伸，以适应交叉轴的区域。
+ 在主轴上，给予子节点的空间必须是不受限制的（unlimited），使得子节点可以全部被容纳，ListBody不会去裁剪或者缩放其子节点。
继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > ListBody
```

示例代码：
```text
Flex(
  direction: Axis.vertical,
  children: <Widget>[
    ListBody(
      mainAxis: Axis.vertical,
      reverse: false,
      children: <Widget>[
        Container(color: Colors.red, width: 50.0, height: 50.0,),
        Container(color: Colors.yellow, width: 50.0, height: 50.0,),
        Container(color: Colors.green, width: 50.0, height: 50.0,),
        Container(color: Colors.blue, width: 50.0, height: 50.0,),
        Container(color: Colors.black, width: 50.0, height: 50.0,),
      ],
  )],
)
```



#### CustomMultiChildLayout
CustomMultiChildLayout提供的delegate可以控制子节点的布局，具体在如下几点：

+ 可以决定每个子节点的布局约束条件；
+ 可以决定每个子节点的位置；
+ 可以决定自身的尺寸，但是自身的自身必须不能依赖子节点的尺寸。

可以看到，跟CustomSingleChildLayout的delegate提供的作用类似，只不过CustomMultiChildLayout的稍微会复杂点。

继承关系：
```text
Object > Diagnosticable > DiagnosticableTree > Widget > RenderObjectWidget > MultiChildRenderObjectWidget > CustomMultiChildLayout
```

[widget 学习参考](https://juejin.im/post/5bab35ff5188255c3272c228)


