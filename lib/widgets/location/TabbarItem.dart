import 'package:flutter/material.dart';
import 'package:iWarden/models/Site.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/textTheme.dart';
import 'package:iWarden/widgets/location/SiteItem.dart';

class TabbarItem extends StatefulWidget {
  final List<Site> sites;
  const TabbarItem({required this.sites, super.key});

  @override
  State<TabbarItem> createState() => _TabbarItemState();
}

class _TabbarItemState extends State<TabbarItem> {
  int currentIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: currentIndexTab,
      child: Column(
        children: <Widget>[
          SizedBox(
            child: TabBar(
              onTap: (index) {
                setState(() {
                  currentIndexTab = index;
                });
              },
              tabs: [
                Tab(
                  child: Text(
                    'Sites near me (${widget.sites.length})',
                    style: CustomTextStyle.caption.copyWith(
                      color: currentIndexTab == 0
                          ? ColorTheme.success
                          : ColorTheme.grey600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Saved sites (5)',
                    style: CustomTextStyle.caption.copyWith(
                      color: currentIndexTab == 1
                          ? ColorTheme.success
                          : ColorTheme.grey600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 280,
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
                        elevation: MaterialStateProperty.all(0),
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
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, i) => Column(
                          children: [
                            SiteItem(siteItem: widget.sites[i]),
                            const Divider(
                              height: 10,
                            ),
                          ],
                        ),
                        itemCount: widget.sites.length,
                      ),
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
