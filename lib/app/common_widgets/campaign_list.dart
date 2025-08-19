import 'package:flutter/material.dart';
import 'package:super_coder_task/app/common_widgets/campaign_tile.dart';

class CampaignList extends StatelessWidget {
  const CampaignList({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
                CampaignTile(),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IgnorePointer(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white70.withOpacity(0.0),
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
