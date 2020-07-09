import 'package:ChariMe/utilities/index.dart';
import 'package:infinity_page_view/infinity_page_view.dart';

class AdvertBanner extends StatefulWidget {
  @override
  _AdvertBannerState createState() => _AdvertBannerState();
}

class _AdvertBannerState extends State<AdvertBanner> {
  int _currentPage = 0;
  final InfinityPageController _pageController =
      InfinityPageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 6) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        InfinityPageView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: slideList.length,
          itemBuilder: (ctx, i) => SlideItem(i),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < slideList.length; i++)
              if (i == _currentPage) SlideDots(true) else SlideDots(false)
          ],
        )
      ],
    );
  }
}
