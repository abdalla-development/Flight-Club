import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../Controller/flight_booking_select_date_controller.dart';
import '../Controller/flight_booking_select_tripType_controller.dart';


class SelectDate extends StatelessWidget {
  SelectDate({Key? key, required this.departureOrReturn}) : super(key: key);

  final String departureOrReturn;
  final flightBookingDate = Get.find<FlightBookingDateController>();
  final flightBooking = Get.find<FlightBookingTripTypeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (departureOrReturn == 'Departure')
                ? 'Departure Date'
                : 'Return Date',
            style: (flightBooking.roundTrip.value ||
                    departureOrReturn == 'Departure')
                ? const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)
                : const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                FontAwesomeIcons.calendar,
                size: 40,
                color: Color(0xff1d1e20),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: (departureOrReturn == 'Departure')
                    ? () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: flightBookingDate.departureDate.value,
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: kSelectDateTheme,
                                ),
                                child: child!,
                              );
                            });
                        if (newDate == null) {
                          return;
                        } else {
                          flightBookingDate.saveSelectedDepartureDay(newDate);
                        }
                      }
                    : (flightBooking.roundTrip.value)
                        ? () async {
                            DateTime? newArrivalDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now().add(const Duration(days: 1)),
                                firstDate: flightBookingDate.returnDate.value,
                                lastDate: DateTime(2100),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: kSelectDateTheme,
                                    ),
                                    child: child!,
                                  );
                                });
                            if (newArrivalDate == null) {
                              return;
                            } else {
                              flightBookingDate
                                  .saveSelectedArrivalDay(newArrivalDate);
                            }
                          }
                        : () {},
                child: (departureOrReturn == 'Departure')
                    ? Text(
                        '${flightBookingDate.departureDate.value.day}/${flightBookingDate.departureDate.value.month}/${flightBookingDate.departureDate.value.year}',
                        style: const TextStyle(fontSize: 18),
                      )
                    : Text(
                        '${flightBookingDate.returnDate.value.day}/${flightBookingDate.returnDate.value.month}/${flightBookingDate.returnDate.value.year}',
                        style: (flightBooking.roundTrip.value)
                            ? const TextStyle(fontSize: 18)
                            : const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
