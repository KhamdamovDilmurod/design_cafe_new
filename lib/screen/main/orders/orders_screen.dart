import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../../../view/table_item_view.dart';
import '../../main_viewmodel.dart';
import '../home/table_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          color: AppColors.background_color,
                          child: GridView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: viewModel.myTablesList.length,
                              shrinkWrap: false,
                              primary: false,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                              itemBuilder: (_, position) {
                                var item = viewModel.myTablesList[position];
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
        viewModel.errorData.listen((event) {
          showError(context, event);
        });

        viewModel.getMyTables();

      },
    );
  }
}
