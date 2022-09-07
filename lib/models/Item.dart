class ItemDraft {
  final String image;
  final String title;
  final String desc;
  final int active;
  final int expired;
  ItemDraft({
    required this.title,
    required this.desc,
    required this.image,
    required this.active,
    required this.expired,
  });
}

class ItemDraftData {
  List<ItemDraft> data = [
    ItemDraft(
        title: "First Seen ",
        desc:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae sem eleifend. ",
        image:
            "https://iconape.com/wp-content/png_logo_vector/mercedes-benz-2.png",
        active: 45,
        expired: 08),
    ItemDraft(
        title: "Grace Period",
        desc:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae sem eleifend. ",
        image:
            "https://iconape.com/wp-content/png_logo_vector/mercedes-benz-2.png",
        active: 45,
        expired: 08),
    ItemDraft(
        title: "Parking Charges",
        desc:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae sem eleifend. ",
        image:
            "https://iconape.com/wp-content/png_logo_vector/mercedes-benz-2.png",
        active: 45,
        expired: 08)
  ];
}
