import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'photos.dart';

void main() => runApp(MaterialApp(
      home: new GalleryMain(),
    ));

class GalleryMain extends StatefulWidget {
  @override
  _GalleryMainState createState() => new _GalleryMainState();
}

const _cacheIosAssetId = "106E99A1-4F6A-45A2-B320-B0AD4A8E8473/L0/001";
const _cacheAndroidAssetId = "/storage/emulated/0/qqmusic/QQImage/1533629267497.jpg";

class _GalleryMainState extends State<GalleryMain> {

  var pathList = <AssetPathEntity>[];

  var ablumList ;
  @override
  void initState() {
    super.initState();
    PhotoManager.addChangeCallback(changeNotify);
    PhotoManager.startChangeNotify();
  }

  void changeNotify() {
    print("on gallery change");
  }

  @override
  void dispose() {
    PhotoManager.removeChangeCallback(changeNotify);
    PhotoManager.stopChangeNotify();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Plugin example app'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            tooltip: "get image path list",
            onPressed: _onlyImage,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            tooltip: "get video path list",
            onPressed: _onlyVideo,
          ),
          IconButton(
            icon: Icon(Icons.create),
            tooltip: "show cache id image",
            onPressed: showImageDialogWithAssetId,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: "open application setting",
            onPressed: _openSetting,
          ),
        ],
      ),
      body:

    //  new ListView.builder(itemBuilder: _buildItem, itemCount: pathList.length,),

      /**
       * ListView 布局
       */
      new ListView.builder(itemBuilder: _buildItem, itemCount: pathList.length,),



      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "get all asset list",
       // onPressed: getImages,
        onPressed: _onlyImage,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var data = pathList[index];
    return _buildWithData(data,index);
    //return _buildHasPreviewItem(context,index);
  }


  /**
   * 每个 item
   */


  var row = Container(

    margin: EdgeInsets.all(4.0),
    child: Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          //new Image.asset("images/share_wechat.png"),
          child: Image.asset(
            "images/share_wechat.png",
            width: 100.0, height: 80.0,
            fit: BoxFit.fill,
          ),

        ),
        Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 8.0),
              height: 80.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    "subTitle",
                    style: TextStyle(
                        fontSize: 16.0
                    ),
                  ),

                ],
              ),
            )
        )


      ],
    ),
  );



  //这个就可以实现返回相册数目
  Widget  _buildWithData(AssetPathEntity data,int index)  {
    bool isPhoto = false;

    Widget widget = FutureBuilder<List<AssetEntity>>(
      future: data.assetList,
      builder: (BuildContext context, AsyncSnapshot<List<AssetEntity>> snapshot) {
        var assetList = snapshot.data;
        if (assetList == null || assetList.isEmpty) {
          return Container(
            child: Text('loading'),
          );
        }
        AssetEntity asset = assetList[0];

        AssetEntity entity = assetList[0];
        Widget leftP;

     //   print("文件夹名字");
       // print(data.name);
       // print("测试图片名字");
       // print(entity.id);
       // print("测试长度");
       // print(assetList.length);


        if( entity.id.endsWith("jpg") || entity.id.endsWith("png")){
          isPhoto = true;
          print("left p is ture");
           leftP =  buildPhtoThumb(context,entity);
        }

     //   entity.thumbDataWithSize(150, 150);

      //  return  ListTile(title: Text(assetList.length.toString()),);

        return  Container(
          color: Colors.white,
          margin: EdgeInsets.all(4.0),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                //new Image.asset("images/share_wechat.png"),
                //左边的缩略图
              //  child: buildPhtoThumb(entity),
                child:
                    !isPhoto?
               new Image.asset("images/share_wechat.png"):
                  //  buildPhtoThumb(entity)
                  //  Image.asset("images/share_wechat.png")
                   leftP,
/*

               //左边的缩略图
                InkWell(
                  onTap: (){
                    print("item photo tap");

                   // var list =  data.assetList;
                    var list =  assetList;
                    print(
                        "open gallery is:${data.name} , count : ${list.length} , list = $list");
                    var page = PhotoPage(
                      pathEntity: data,
                      photos: list,
                    );
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));


                  },
                  child: Image.asset("images/share_wechat.png", width: 100.0, height: 80.0, fit: BoxFit.fill,),

                )
*/
              ),
              Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 8.0),
                    height: 80.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          assetList.length.toString(),
                          style: TextStyle(
                              fontSize: 16.0
                          ),
                        ),

                      ],
                    ),
                  )
              )


            ],
          ),
        );



      },
    );


    Widget ges = GestureDetector(
      child: widget,
      onTap: () async {
        var list = await data.assetList;
        print(
            "open gallery is:${data.name} , count : ${list.length} , list = $list");
        var page = PhotoPage(
          pathEntity: data,
          photos: list,
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => page));
      },
    );
     return ges;
  }


  Widget buildPhtoThumb(BuildContext context, AssetEntity entity ) {
   return FutureBuilder<Uint8List>(
      future: entity.thumbDataWithSize(150, 150),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return   Image.memory(
            snapshot.data,
            fit: BoxFit.cover,
            width:80,
            height: 80,
          );

        }
        return Center(
          child: Text('loading...'),
        );
      },
    );
  }

  // This is an example of how to build album preview.
  Widget _buildHasPreviewItem(BuildContext context, int index) {
    var data = pathList[index];
    Widget widget = FutureBuilder<List<AssetEntity>>(
      future: data.assetList,
      builder:
          (BuildContext context, AsyncSnapshot<List<AssetEntity>> snapshot) {
        var assetList = snapshot.data;
        if (assetList == null || assetList.isEmpty) {
          return Container(
            child: Text('loading'),
          );
        }
        AssetEntity asset = assetList[0];
        return _buildPreview(asset);
      },
    );

    return widget;
  }

  Widget _buildPreview(AssetEntity asset) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbDataWithSize(200, 200),
      builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
        if (snapshot.data != null) {
          return Image.memory(snapshot.data);
        }
        return Container();
      },
    );
  }


  void _openSetting() {
    PhotoManager.openSetting();
  }

  void getImages() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }

    print("wait scan");
    List<AssetPathEntity> list = await PhotoManager.getAssetPathList(hasVideo: false);

    List<int> pl = new List(list.length);

    for(int i = 0; i < list.length; i ++){
     var tempList   =  await list[i].assetList;
     pl[i] = tempList.length;
    }

    ablumList = pl;

    pathList.clear();
    //pathList 保存相册中 list 集合
    pathList.addAll(list);
    setState(() {});

    // var r = await ImagePicker.pickImages(source: ImageSource.gallery, numberOfItems: 10);
    // print(r);
  }

  void _onlyVideo() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }
    var pathList = await PhotoManager.getVideoAsset();
    updateDatas(pathList);
  }

  void _onlyImage() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }
    var pathList = await PhotoManager.getImageAsset();
    updateDatas(pathList);
  }

  updateDatas(List<AssetPathEntity> list) {
    pathList.clear();
    pathList.addAll(list);
    setState(() {});
  }

  void showImageDialogWithAssetId() async {
    String id;

    if (Platform.isIOS) {
      id = _cacheIosAssetId;
    } else if (Platform.isAndroid) {
      id = _cacheAndroidAssetId;
    }

    if (id == null) {
      return;
    }

    var asset = await createAssetEntityWithId(id);

    showDialog(
      context: context,
      builder: (ctx) {
        return GestureDetector(
          child: _buildPreview(asset),
          onTap: () => Navigator.pop(ctx),
        );
      },
    );
  }
}
