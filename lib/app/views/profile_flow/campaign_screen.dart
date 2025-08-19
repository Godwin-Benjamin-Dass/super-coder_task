import 'package:flutter/material.dart';

import 'package:super_coder_task/app/common_widgets/campaign_list.dart';
import 'package:super_coder_task/app/common_widgets/custom_appbar.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbar(
              title: '캠페인 매칭',
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              controller: _tabController,
              indicatorColor: const Color(AppColors.primary),
              dividerColor: const Color(0xffF2F2F2),
              tabs: const <Widget>[
                Tab(
                  icon: Text(
                    '신청',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  icon: Text(
                    '진행중',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  icon: Text(
                    '완료',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(controller: _tabController, children: const [
              CampaignList(),
              CampaignList(),
              CampaignList(),
            ])),
          ],
        ),
      ),
    );
  }
}
