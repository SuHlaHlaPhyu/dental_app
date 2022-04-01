import 'package:flutter/material.dart';

class SmartListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsets padding;
  final Function onListEndReached;

  SmartListView(
      {required this.itemCount,
      required this.itemBuilder,
      required this.padding,
      required this.onListEndReached});

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list reached");
        } else {
          print("End of the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Container(
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: widget.itemBuilder,
          itemCount: widget.itemCount,
          controller: _scrollController,
          //scrollDirection: Axis.vertical,
          padding: widget.padding,
        ),
      ),
    );
  }

  Future<void> _refresh() {
    return Future.delayed(const Duration(seconds: 3));
  }
}
