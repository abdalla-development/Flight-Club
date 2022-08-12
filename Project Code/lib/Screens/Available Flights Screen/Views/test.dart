// flightsData.clear();
// for(var obj in data){
// // add dates
// if(!availableDates.contains(obj['local_departure'].split('T')[0])){
// availableDates.add(obj['local_departure'].split('T')[0]);
// FlightDealsFilterByDayWidgetConstructor filterByDayWidgetConstructor = FlightDealsFilterByDayWidgetConstructor(date: obj['local_departure'].split('T')[0], index: itemRowIndex.value,);
// SizedBox sizedBox = const SizedBox(width: 8,);
// flightsDealsDatesRow.add(filterByDayWidgetConstructor);
// flightsDealsDatesRow.add(sizedBox);
// itemRowIndex.value ++;
// }
// for(var date in availableDates){
// for (var obj in responseDataDealsTotal){
// if(date == obj['local_departure'].split('T')[0]){
// AvailableFlightsCardOneWay flightsCard = AvailableFlightsCardOneWay(
// index: itemIndex.value,
// departureCity: obj['flyFrom'],
// departureTime: '${obj['local_departure'].split('T')[1].split(':')[0]}:${obj['local_departure'].split('T')[1].split(':')[1]}',
// arrivalCity: obj['flyTo'],
// arrivalTime: '${obj['local_arrival'].split('T')[1].split(':')[0]}:${obj['local_arrival'].split('T')[1].split(':')[1]}',
// flightDuration: '${(obj['duration']['total']/60/60).toString().split('.')[0]}h ${(obj['duration']['total']/60/60).toStringAsFixed(2).split('.')[1]}m',
// flightPrice: obj['price'].toString(),
// handBagWeight: (obj['baglimit']['hand_weight'].toString()=='null')? '0' : obj['baglimit']['hand_weight'].toString(),
// checkInBagWeight: obj['baglimit']['hold_weight'].toString(),
// );
// SizedBox space = const SizedBox(
// height: 30,
// );
// flightsData.add(flightsCard);
// flightsData.add(space);
// }
// }
// dealsData[currentDealPageIndex.value]= flightsData;
// currentDealPageIndex.value++;
// }
// }
// print(dealsData);

//------------------------------------------------------------------------------------------

// if(homeCallingScreen.bookingDeals.value=='Flight Deals'){
//   // for(var obj in data){
//   //   if(!availableDates.contains(obj['local_departure'].split('T')[0])){
//   //     availableDates.add(obj['local_departure'].split('T')[0]);
//   //     FlightDealsFilterByDayWidgetConstructor filterByDayWidgetConstructor = FlightDealsFilterByDayWidgetConstructor(date: obj['local_departure'].split('T')[0], index: itemRowIndex.value,);
//   //     SizedBox sizedBox = const SizedBox(width: 8,);
//   //     flightsDealsDatesRow.add(filterByDayWidgetConstructor);
//   //     flightsDealsDatesRow.add(sizedBox);
//   //     itemRowIndex.value ++;
//   //   }
//   // }
//   updateRowItemIndex(0);
// }

//--------------------------------------------------------------------------------------------------


// String currentDate = availableDates[itemRowIndex.value];
// for(var date in availableDates){
//   flightsData.clear();
//   for (var obj in responseDataDealsTotal){
//     if(date == obj['local_departure'].split('T')[0]){
//           AvailableFlightsCardOneWay flightsCard = AvailableFlightsCardOneWay(
//             index: itemIndex.value,
//             departureCity: obj['flyFrom'],
//             departureTime: '${obj['local_departure'].split('T')[1].split(':')[0]}:${obj['local_departure'].split('T')[1].split(':')[1]}',
//             arrivalCity: obj['flyTo'],
//             arrivalTime: '${obj['local_arrival'].split('T')[1].split(':')[0]}:${obj['local_arrival'].split('T')[1].split(':')[1]}',
//             flightDuration: '${(obj['duration']['total']/60/60).toString().split('.')[0]}h ${(obj['duration']['total']/60/60).toStringAsFixed(2).split('.')[1]}m',
//             flightPrice: obj['price'].toString(),
//             handBagWeight: (obj['baglimit']['hand_weight'].toString()=='null')? '0' : obj['baglimit']['hand_weight'].toString(),
//             checkInBagWeight: obj['baglimit']['hold_weight'].toString(),
//           );
//           SizedBox space = const SizedBox(
//             height: 30,
//           );
//           flightsData.add(flightsCard);
//           flightsData.add(space);
//     }
//   }
//
// }
// // availableFlights.toggleLoadingSpinner();
// print(currentDate);
// for(var obj in responseDataDealsTotal){
//   if(obj['local_departure'].split('T')[0] == currentDate){
//     dealsIndexList.add(itemIndex);
//   }
//   itemIndex.value ++;
// }
// dealsStartIndex.value = dealsIndexList.first();
// dealsEndIndex.value = dealsIndexList.last() +1;
// print(dealsStartIndex.value);
// print(dealsEndIndex.value);
// print(dealsIndexList);
// print(flightsDataDeals);
// flightsDataDeals.clear();
// print(flightsDataDeals);
// for(var obj in responseDataDealsTotal){
//   if(currentDate == obj['local_departure'].split('T')[0] ){
//     AvailableFlightsCardOneWay flightsCard = AvailableFlightsCardOneWay(
//       index: itemIndex.value,
//       departureCity: obj['flyFrom'],
//       departureTime: '${obj['local_departure'].split('T')[1].split(':')[0]}:${obj['local_departure'].split('T')[1].split(':')[1]}',
//       arrivalCity: obj['flyTo'],
//       arrivalTime: '${obj['local_arrival'].split('T')[1].split(':')[0]}:${obj['local_arrival'].split('T')[1].split(':')[1]}',
//       flightDuration: '${(obj['duration']['total']/60/60).toString().split('.')[0]}h ${(obj['duration']['total']/60/60).toStringAsFixed(2).split('.')[1]}m',
//       flightPrice: obj['price'].toString(),
//       handBagWeight: (obj['baglimit']['hand_weight'].toString()=='null')? '0' : obj['baglimit']['hand_weight'].toString(),
//       checkInBagWeight: obj['baglimit']['hold_weight'].toString(),
//     );
//     SizedBox space = const SizedBox(
//       height: 30,
//     );
//     flightsData.add(flightsCard);
//     flightsData.add(space);
//   }
//   itemIndex.value ++;
// }
// flightsData = flightsDataDealsRX as List<Widget>;
// print(flightsDataDeals);
// flightsDataDealsRX.value = flightsDataDeals;
// availableFlights.toggleLoadingSpinner();