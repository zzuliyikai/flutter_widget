import 'package:flutter/material.dart';
import 'package:fultter/app_colors.dart';

//新建一个数据结构
class NavigationIconView {

  String _title;
  IconData _icon;
  IconData _activeIcon;
  Color _color;
  BottomNavigationBarItem _item;

  NavigationIconView(
      {IconData icon, IconData activeIcon, String title, Color color})
      :
        _title = title,
        _activeIcon = activeIcon,
        _icon = icon,
        _item = new BottomNavigationBarItem(
            icon: Icon(icon),
            activeIcon: Icon(activeIcon),
            backgroundColor: color,
            title: Text(title,style: TextStyle(fontSize: 14.0),)
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenSate createState() {
    return _HomeScreenSate();
  }
}

class _HomeScreenSate extends State<HomeScreen> {

  List<NavigationIconView> _navigationIconViewList;
  List<Widget> _pageList;
  PageController _pageController;


  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: _currentIndex);
    _pageList = [
      new Container(
        child: Center(
          child: Text("微信"),
        ),
      ),
      new Container(
        child: Center(
          child: Text("发现"),
        ),
      ),
      new Container(
        child: Center(
          child: Text("朋友圈"),
        ),
      ),
      new Container(
        child: Center(
          child: Text("我"),
        ),
      )
    ];
    _navigationIconViewList = <NavigationIconView>[
      new NavigationIconView(
          icon: IconData(
            0xe654,
            fontFamily: AppFonts.fontsFamily,
          ),
          activeIcon: IconData(
            0xe654,
            fontFamily: AppFonts.fontsFamily,
          ),
          title: "微信",
          color: Colors.red
      ),
      NavigationIconView(
          icon: IconData(
            0xe60b,
            fontFamily: AppFonts.fontsFamily,
          ),
          activeIcon: IconData(
            0xe60b,
            fontFamily: AppFonts.fontsFamily,
          ),
          title: "发现",
          color: Colors.red
      ),
      new NavigationIconView(
          icon: IconData(
            0xe631,
            fontFamily: AppFonts.fontsFamily,
          ),
          activeIcon: IconData(
            0xe631,
            fontFamily: AppFonts.fontsFamily,
          ),
          title: "通讯录",
          color: Colors.red
      ),
      NavigationIconView(
          icon: IconData(
            0xe619,
            fontFamily: AppFonts.fontsFamily,
          ),
          activeIcon: IconData(
            0xe619,
            fontFamily: AppFonts.fontsFamily,
          ),
          title: "我",
          color: Colors.red
      ),
    ];
  }

  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _bottomNavigationBarItemList = new List<
        BottomNavigationBarItem>();

    for (NavigationIconView navigationIconView in _navigationIconViewList) {
      _bottomNavigationBarItemList.add(navigationIconView._item);
    }


    BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
      fixedColor: Color(AppColors.tabIconActopn),
      items: _bottomNavigationBarItemList,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: new Duration(milliseconds: 200), curve: Curves.easeIn);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("wechat"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            print("onPress search");
          }),
          Container(
          width: 16.0,
          ),
          PopupMenuButton(itemBuilder: (BuildContext context){
            return <PopupMenuItem<String>>[
              new PopupMenuItem(child: Text("发起聊天"),value: "发起聊天",),
              new PopupMenuItem(child: Text("扫一扫"),value: "扫一扫",),
              new PopupMenuItem(child: Text("发现"),value: "发现",),
              new PopupMenuItem(child: Text("找朋友"),value: "找朋友",),
              new PopupMenuItem(child: Text("一起嗨"),value: "一起嗨",),
            ];
          },
            onSelected: (String s){

            },
          icon: Icon(Icons.add),
          ),
          Container(
            width: 16.0,
          )
        ],
      ),
      body:PageView.builder(itemBuilder: (BuildContext context,int index){

        return _pageList[index];

      },
        controller: _pageController,
      onPageChanged: (int index){
        setState(() {
          _currentIndex = index;
        });
      },
        itemCount: _pageList.length,
      ),

      bottomNavigationBar: bottomNavigationBar,
    );
  }
}