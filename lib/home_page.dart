import 'package:flutter/material.dart';

import 'dummy_data_model.dart';
import 'page_view_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _page = 0;

  int get _firstItemIndex => _page.toInt();

  final _controller = PageController(
    viewportFraction: 0.5,
  );

  late final _itemWidth =
      MediaQuery.of(context).size.width * _controller.viewportFraction;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {
          _page = _controller.page!;
        }));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Flutter Folding Scroll Demo"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: 200,
                    width: _itemWidth,
                    child: FractionallySizedBox(
                      child: PageViewItem(
                        index: _firstItemIndex,
                        width: _itemWidth,
                        img: dummyDataModel[_firstItemIndex],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                  padEnds: false,
                  controller: _controller,
                  itemBuilder: (context, index) {
                    return Opacity(
                      opacity: index <= _firstItemIndex ? 0 : 1,
                      child: PageViewItem(
                        index: index,
                        width: _itemWidth,
                        img: dummyDataModel[index],
                      ),
                    );
                  },
                  itemCount: dummyDataModel.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
