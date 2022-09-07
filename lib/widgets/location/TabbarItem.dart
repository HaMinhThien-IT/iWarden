import 'package:flutter/material.dart';
import 'package:iWarden/models/Site.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';

class TabbarItem extends StatefulWidget {
  final List<Site> sites;
  const TabbarItem({required this.sites, super.key});

  @override
  State<TabbarItem> createState() => _TabbarItemState();
}

class _TabbarItemState extends State<TabbarItem> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          SizedBox(
            child: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Sites near me (${widget.sites.length})',
                    style: CustomTextStyle.caption.copyWith(
                      color: ColorTheme.grey600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Saved sites (5)',
                    style: CustomTextStyle.caption.copyWith(
                      color: ColorTheme.grey600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: TabBarView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          ColorTheme.lighterPrimary,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 0,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Refresh GPS',
                        style: CustomTextStyle.chart.copyWith(
                          decoration: TextDecoration.underline,
                          color: ColorTheme.primary,
                        ),
                      ),
                      icon: Icon(
                        Icons.refresh_outlined,
                        size: 24,
                        color: ColorTheme.primary,
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          visualDensity: const VisualDensity(
                            horizontal: 0,
                            vertical: -4,
                          ),
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 0,
                          ),
                          leading: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: ColorTheme.primary,
                            ),
                          ),
                          horizontalTitleGap: -20,
                          title: Text(
                            'Brisker Count',
                            style: CustomTextStyle.body1.copyWith(
                              color: ColorTheme.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '71 Cherry Court SOUTHAMPTON SO53 5PD UK',
                            style: CustomTextStyle.chart.copyWith(
                              color: ColorTheme.grey600,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const Divider(
                          height: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                const Center(
                  child: Text("Saved sites"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
