import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:q_pal_kiosk_app/domain/model/reservation.dart';
import 'package:q_pal_kiosk_app/resources/font_manager.dart';
import 'package:q_pal_kiosk_app/resources/values_manager.dart';

class GuideCard extends HookConsumerWidget {
  final String title;
  final MaterialColor color;
  final List<Reservation> reservations;

  const GuideCard({
    super.key,
    required this.title,
    required this.color,
    required this.reservations,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(reservations.toString());

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 5 * 2,
        child: Card(
          shadowColor: Colors.grey,
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSize.s12),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s16),
                    topRight: Radius.circular(AppSize.s16),
                  ),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: AppSize.s18,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    children: List.generate(
                      reservations.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(AppSize.s8),
                        child: Container(
                          width: AppSize.s60,
                          height: AppSize.s60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${reservations[index].reservationNumber}',
                            style: const TextStyle(fontSize: FontSize.s24),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
