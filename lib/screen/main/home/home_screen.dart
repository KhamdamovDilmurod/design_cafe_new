import 'dart:async';

import 'package:bdm_cafe/screen/auth/auth_screen.dart';
import 'package:bdm_cafe/screen/main/home/table_screen.dart';
import 'package:bdm_cafe/screen/main_viewmodel.dart';
import 'package:bdm_cafe/utils/pref_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../model/event_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/get_it.dart';
import '../../../utils/utils.dart';
import '../../../view/branch_view.dart';
import '../../../view/table_item_view.dart';
import '../../chef/chef_main_screen.dart';

class HomeScreen extends StatefulWidget {
  int categoryId = 0;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  var firstTimeStart = true;



  StreamSubscription? _busEventListener;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _busEventListener?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () {
        return MainViewModel();
      },
      builder: (BuildContext context, MainViewModel viewModel, Widget? child) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                color: AppColors.background_color,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 64,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.rooms.length,
                          itemBuilder: (_, position) {
                            var item = viewModel.rooms[position];

                            if (firstTimeStart) {
                              for (var element in viewModel.rooms) {
                                element.checked = false;
                              }
                              item.checked = true;
                              widget.categoryId = item.id;
                              firstTimeStart = false;
                            }

                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      for (var element in viewModel.rooms) {
                                        element.checked = false;
                                      }
                                      item.checked = true;
                                    });
                                    widget.categoryId = item.id;
                                    viewModel.getTableByRoom(widget.categoryId);
                                  },
                                  child: BranchItemView(item: item)),
                            );
                          }),
                    ),
                    Divider(
                      thickness: 1,
                      height: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          color: AppColors.background_color,
                          child: GridView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: viewModel.tableList.length,
                              shrinkWrap: false,
                              primary: false,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemBuilder: (_, position) {
                                var item = viewModel.tableList[position];
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => TableScreen(
                                                    tableId: item.id,
                                                  )));
                                    },
                                    child: TableItemView(item: item));
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (viewModel.progressData) showAsProgress(),
            ],
          ),
        );
      },
      onModelReady: (viewModel) {
        _busEventListener = eventBus.on<EventModel>().listen((event) async {
          if (event.event == EVENT_TABLE_UPDATE) {
            viewModel.getTableByRoom(widget.categoryId);
          } else if (event.event == EVENT_LOG_OUT) {}
        });

        viewModel.errorData.listen((event) {
          showError(context, event);
        });

        viewModel.roomsData.listen((event) {
          setState(() {
          });
          if (widget.categoryId == 0) {
            widget.categoryId = event[0].id;
          }
          viewModel.getTableByRoom(widget.categoryId);
        });

        viewModel.getRooms();
      },
    );
  }
}
