import 'package:flutter/material.dart';
import 'package:super_coder_task/app/utils/app_colors.dart';

class CampaignTile extends StatelessWidget {
  const CampaignTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                  fit: BoxFit.cover,
                  'https://cdn.pixabay.com/photo/2021/12/12/20/00/play-6865967_640.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '회사명 나오는 자리',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 160,
                  child: const Text(
                    '소개말 나오는 자리입니다 한줄만 나옵니다. 소개말 나...',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F3FE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          'F&B',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.primary)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F3FE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          '패션',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.primary)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F3FE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          '육아/키즈',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.primary)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        color: const Color(0xffF8F3FE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          '리빙/인테리어',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color(AppColors.primary)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
