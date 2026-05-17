import 'package:commit_app/theme/app_color.dart';
import 'package:flutter/material.dart';
import './utils/app_size.dart';
import './theme/app_theme.dart';

void main() {
  runApp(CommitApp());
}

class CommitApp extends StatelessWidget {
  const CommitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        // appBar: MasterAppBar(title: ''),
        body: SafeArea(
          child: RefreshIndicator(
            color: AppColor.background,
            backgroundColor: AppColor.textPrimary,
            onRefresh: () async {},
            child: SizedBox(
              height: AppSize.bodyHeight(context),
              width: AppSize.screenWidth(context),
              // color: Colors.amber,
              // padding: EdgeInsets.all(20),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: AppSize.bodyHeight(context) / 10,
                        // width: AppSize.screenWidth(context),
                        // color: Colors.amber,
                        padding: EdgeInsets.only(
                          left: AppSize.screenWidth(context) / 10,
                          right: AppSize.screenWidth(context) / 10,
                          top: AppSize.screenWidth(context) / 15,
                          bottom: AppSize.screenWidth(context) / 15,
                        ),
                        child: Center(
                          // child: Text(
                          //   'A different life requires different habits. You are now committed to finish all of your tasks below.',
                          //   style: AppTheme.lightTheme.textTheme.titleSmall,
                          //   textAlign: TextAlign.center,
                          // ),
                          child: Text.rich(
                            TextSpan(
                              style: AppTheme.lightTheme.textTheme.titleSmall,
                              children: [
                                TextSpan(text: 'You are now '),
                                TextSpan(
                                  text: 'committed',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: ' to finish all of your tasks below.',
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      for (int i = 0; i < 20; i++)
                        // Container(
                        //   width: AppSize.screenWidth(context),
                        //   padding: EdgeInsets.only(left: 20),
                        //   child: Text('Test $i'),
                        // ),
                        if (i < 20 - 1)
                          Column(
                            children: [
                              Container(
                                // height: AppSize.screenHeight(context) / 5,
                                width: AppSize.screenWidth(context),
                                margin: EdgeInsets.only(
                                  left: AppSize.screenWidth(context) / 10,
                                  right: AppSize.screenWidth(context) / 10,
                                ),
                                padding: EdgeInsets.only(
                                  left: AppSize.screenWidth(context) / 10,
                                  right: AppSize.screenWidth(context) / 10,
                                  top: AppSize.screenHeight(context) / 50,
                                  bottom: AppSize.screenHeight(context) / 50,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.background,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: AppColor.border,
                                    width: 1.5,
                                  ),
                                ),
                                // color: Colors.red,
                                child: Text(
                                  "Test",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.screenHeight(context) / 30,
                                width: AppSize.screenWidth(context) / 1.3,
                                child: Divider(
                                  color: AppColor.border,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          )
                        else
                          Container(
                            // height: AppSize.screenHeight(context) / 5,
                            width: AppSize.screenWidth(context),
                            margin: EdgeInsets.only(
                              left: AppSize.screenWidth(context) / 10,
                              right: AppSize.screenWidth(context) / 10,
                            ),
                            padding: EdgeInsets.only(
                              left: AppSize.screenWidth(context) / 10,
                              right: AppSize.screenWidth(context) / 10,
                              top: AppSize.screenHeight(context) / 50,
                              bottom: AppSize.screenHeight(context) / 50,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.background,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColor.border,
                                width: 1.5,
                              ),
                            ),
                            // color: Colors.red,
                            child: Text("Test", textAlign: TextAlign.center),
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
