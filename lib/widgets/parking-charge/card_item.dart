import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iWarden/helpers/format_date.dart';
import 'package:iWarden/models/contravention.dart';
import 'package:iWarden/theme/color.dart';
import 'package:iWarden/theme/text_theme.dart';

final azureContainerImageUrl = dotenv.get(
  'AZURE_CONTAINER_IMAGE_URL',
  fallback: 'https://iwardendev.blob.core.windows.net/wardentest',
);

class CardItemParkingCharge extends StatelessWidget {
  final String? image;
  final String plate;
  final List<ContraventionReasonTranslations> contraventions;
  final DateTime created;

  const CardItemParkingCharge({
    Key? key,
    required this.image,
    required this.plate,
    required this.contraventions,
    required this.created,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 0,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: SizedBox(
            width: 72,
            height: 72,
            child: Image.network(
              "$azureContainerImageUrl/$image",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.error,
                color: ColorTheme.danger,
              ),
            ),
          ),
        ),
        title: Text(
          plate.toUpperCase(),
          style: CustomTextStyle.h4.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contravention: ${contraventions.map((item) => item.detail).toString().replaceAll('(', '').replaceAll(')', '')}",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
            ),
            const SizedBox(height: 5),
            Text(
              "Created: ${FormatDate().getLocalDate(created)}",
              style: CustomTextStyle.h6.copyWith(color: ColorTheme.grey600),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
