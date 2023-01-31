// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mecanum_wheel_drivetrain_controller/cubits/cubits.dart';
import 'package:mecanum_wheel_drivetrain_controller/utils/utils.dart';
import 'package:mecanum_wheel_drivetrain_controller/widgets/widgets.dart';
import 'package:rive/rive.dart';

class SelectConnectionScreen extends StatefulWidget {
  const SelectConnectionScreen({super.key});

  @override
  State<SelectConnectionScreen> createState() => _SelectConnectionScreenState();
}

class _SelectConnectionScreenState extends State<SelectConnectionScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(
              padding,
            ),
            child: Column(
              children: [
                Text(
                  selectModeText,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: largePadding - tinyPadding,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: veryTinyPadding,
                  color: white34,
                  margin: const EdgeInsets.symmetric(
                    vertical: padding,
                    horizontal: veryLargePadding + largePadding,
                  ),
                  child: Divider(
                    color: white74,
                    height: veryTinyPadding,
                    thickness: veryTinyPadding,
                    indent: padding,
                    endIndent: padding,
                  ),
                ),
                const SizedBox(
                  height: veryLargePadding,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: white15,
                    borderRadius: BorderRadius.circular(
                      largePadding + smallPadding + tinyPadding,
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const AnimatedConnectionModeButton(
                          mode: ConnectionMode.wifi,
                        ),
                        // SizedBox(
                        //   height: twoHundredDotNil,
                        //   width: oneFiftySevenDotSevenFive,
                        //   child: RiveAnimation.asset(
                        //     connectionModeButtonAnimationRiveAsset,
                        //     onInit: _onWifiInit,
                        //   ),
                        // ),
                        Container(
                          width: veryTinyPadding,
                          color: white34,
                          margin: const EdgeInsets.symmetric(
                            vertical: padding,
                          ),
                          child: VerticalDivider(
                            color: white74,
                            width: veryTinyPadding,
                            thickness: veryTinyPadding,
                            indent: padding,
                            endIndent: padding,
                          ),
                        ),
                        const AnimatedConnectionModeButton(
                          mode: ConnectionMode.bluetooth,
                        ),
                        // SizedBox(
                        //   height: twoHundredDotNil,
                        //   width: oneFiftySevenDotSevenFive,
                        //   child: RiveAnimation.asset(
                        //     connectionModeButtonAnimationRiveAsset,
                        //     onInit: _onBluetoothInit,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: extraLargePadding,
                ),
                ElevatedButton(
                  onPressed: () {
                    //.
                  },
                  child: Text(
                    nextStepText,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: padding + tinyPadding + tinyPadding,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            // ValueListenableBuilder<ConnectionMode?>(
            //   valueListenable: _connectionMode,
            //   builder: (_, connectionModeValue, __) => AnimatedSize(
            //     duration: Duration(
            //       milliseconds: threeHundredDotNil.toInt(),
            //     ),
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Text(
            //           selectModeText,
            //           textAlign: TextAlign.center,
            //           style: TextStyle(
            //             fontSize: padding + tinyPadding + tinyPadding,
            //           ),
            //         ),
            //         const SizedBox(
            //           height: largePadding + padding,
            //         ),
            //         InkWell(
            //           borderRadius: BorderRadius.circular(
            //             veryLargePadding,
            //           ),
            //           onTap: () {
            //             if (connectionModeValue != ConnectionMode.wifi) {
            //               _connectionMode.value = ConnectionMode.wifi;
            //             } else {
            //               BlocProvider.of<ScreenToShowCubit>(context)
            //                   .setScreenToShow(
            //                 ScreenToShow.wifiOps,
            //               );
            //             }
            //           },
            //           child: AnimatedContainer(
            //             duration: Duration(
            //               milliseconds: threeHundredDotNil.toInt(),
            //             ),
            //             padding: EdgeInsets.symmetric(
            //               horizontal: smallPadding,
            //               vertical: connectionModeValue == ConnectionMode.wifi
            //                   ? nil
            //                   : smallPadding,
            //             ),
            //             decoration: BoxDecoration(
            //               color: connectionModeValue == ConnectionMode.wifi
            //                   ? baseColor
            //                   : null,
            //               border: connectionModeValue == ConnectionMode.wifi
            //                   ? null
            //                   : Border.all(
            //                       color: Colors.grey,
            //                     ),
            //               borderRadius: BorderRadius.circular(
            //                 veryLargePadding,
            //               ),
            //             ),
            //             child: AnimatedSize(
            //               duration: Duration(
            //                 milliseconds: threeHundredDotNil.toInt(),
            //               ),
            //               child: AnimatedSwitcher(
            //                 duration: Duration(
            //                   milliseconds: threeHundredDotNil.toInt(),
            //                 ),
            //                 child: Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     Icon(
            //                       Icons.wifi,
            //                       color:
            //                           connectionModeValue == ConnectionMode.wifi
            //                               ? Colors.white
            //                               : Colors.grey,
            //                       size:
            //                           connectionModeValue == ConnectionMode.wifi
            //                               ? veryLargePadding
            //                               : veryLargePadding - smallPadding,
            //                     ),
            //                     if (connectionModeValue == ConnectionMode.wifi)
            //                       const SizedBox(
            //                         width: padding,
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue == ConnectionMode.wifi)
            //                       const Text(
            //                         wifiText,
            //                         style: TextStyle(
            //                           fontSize: largePadding,
            //                           color: Colors.white,
            //                         ),
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue == ConnectionMode.wifi)
            //                       const SizedBox(
            //                         width: padding,
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue == ConnectionMode.wifi)
            //                       const SizedBox(
            //                         width: veryLargePadding + largePadding,
            //                         height: veryLargePadding + largePadding,
            //                         child: RiveAnimation.asset(
            //                           canGoNextAnimationRiveAsset,
            //                         ),
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         const SizedBox(
            //           height: largePadding + padding,
            //         ),
            //         InkWell(
            //           borderRadius: BorderRadius.circular(
            //             veryLargePadding,
            //           ),
            //           onTap: () {
            //             if (connectionModeValue != ConnectionMode.bluetooth) {
            //               _connectionMode.value = ConnectionMode.bluetooth;
            //             } else {
            //               BlocProvider.of<ScreenToShowCubit>(context)
            //                   .setScreenToShow(
            //                 ScreenToShow.bluetoothOps,
            //               );
            //             }
            //           },
            //           child: AnimatedContainer(
            //             duration: Duration(
            //               milliseconds: threeHundredDotNil.toInt(),
            //             ),
            //             padding: EdgeInsets.symmetric(
            //               horizontal: smallPadding,
            //               vertical:
            //                   connectionModeValue == ConnectionMode.bluetooth
            //                       ? nil
            //                       : smallPadding,
            //             ),
            //             decoration: BoxDecoration(
            //               color: connectionModeValue == ConnectionMode.bluetooth
            //                   ? baseColor
            //                   : null,
            //               border:
            //                   connectionModeValue == ConnectionMode.bluetooth
            //                       ? null
            //                       : Border.all(
            //                           color: Colors.grey,
            //                         ),
            //               borderRadius: BorderRadius.circular(
            //                 veryLargePadding,
            //               ),
            //             ),
            //             child: AnimatedSize(
            //               duration: Duration(
            //                 milliseconds: threeHundredDotNil.toInt(),
            //               ),
            //               child: AnimatedSwitcher(
            //                 duration: Duration(
            //                   milliseconds: threeHundredDotNil.toInt(),
            //                 ),
            //                 child: Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     Icon(
            //                       Icons.bluetooth,
            //                       color: connectionModeValue ==
            //                               ConnectionMode.bluetooth
            //                           ? Colors.white
            //                           : Colors.grey,
            //                       size: connectionModeValue ==
            //                               ConnectionMode.bluetooth
            //                           ? veryLargePadding
            //                           : veryLargePadding - smallPadding,
            //                     ),
            //                     if (connectionModeValue ==
            //                         ConnectionMode.bluetooth)
            //                       const SizedBox(
            //                         width: nil,
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue ==
            //                         ConnectionMode.bluetooth)
            //                       const Text(
            //                         bluetoothText,
            //                         style: TextStyle(
            //                           fontSize: largePadding,
            //                           color: Colors.white,
            //                         ),
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue ==
            //                         ConnectionMode.bluetooth)
            //                       const SizedBox(
            //                         width: smallPadding,
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                     if (connectionModeValue ==
            //                         ConnectionMode.bluetooth)
            //                       const SizedBox(
            //                         width: veryLargePadding + largePadding,
            //                         height: veryLargePadding + largePadding,
            //                         child: RiveAnimation.asset(
            //                           canGoNextAnimationRiveAsset,
            //                         ),
            //                       )
            //                     else
            //                       const SizedBox.shrink(),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
        ),
      );
}
