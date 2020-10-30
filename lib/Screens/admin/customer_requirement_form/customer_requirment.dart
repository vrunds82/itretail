import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Global/vars.dart';
import 'package:http/http.dart' as http;

class CustomerRequirement extends StatefulWidget {
  @override
  _CustomerRequirementState createState() => _CustomerRequirementState();
}

class _CustomerRequirementState extends State<CustomerRequirement> {
  Map<String, bool> cRF ;
  Map<String, int> levels ;
  
  
  createMap() {
   cRF = {
      "1": onBoardingQuestionnaire,
      "2": merchantInfo,
      "3": hardwareInfo,
      "3.1": contractBringYourOwnHardware,
      "3.2": pictureAllPorts,
      "3.3": pictureScale,
      "3.4": pictureScanner,
      "3.5": picturePrinter,
      "4": storePicture,
      "5": processOrder,
      "5.1": computerInStock,
      "5.2": pinPad,
      "5.3": scale,
      "5.4": scanner,
      "5.5": printer,
      "5.6": handScanner,
      "5.7": cashDrawer,
      "5.8": mounts,
      "5.9": zyWall,
      "6": training,
      "7": backOfficeSetup,
      "8": productFile,
      "8.1": productTemplate,
      "8.2": pictureUPC,
      "8.3": pictureEAN,
      "8.4": picture002,
      "9": finalPayment,
      /*"10": equipmentPayment,*/
      "10": install,
      "11": trainingGoLive
    };
    print(cRF);
  }
  createCRFIntMap() {
   levels = {
      "1": onBoardingQuestionnaire==true?0:5,
      "2": merchantInfo==true?0:5,
      "3": (contractBringYourOwnHardware == false ||
          pictureAllPorts == false ||
          pictureScale == false ||
          pictureScanner == false ||
          picturePrinter == false)==true?0:5,
      /* "3.1": contractBringYourOwnHardware==true?0:5,
      "3.2": pictureAllPorts==true?0:5,
      "3.3": pictureScale==true?0:5,
      "3.4": pictureScanner==true?0:5,
      "3.5": picturePrinter==true?0:5,*/
      "4": storePicture==true?0:5,
      "5": (computerInStock == false ||
          pinPad == false ||
          scale == false ||
          scanner == false ||
          printer == false ||
          handScanner == false ||
          cashDrawer == false ||
          mounts == false ||
          zyWall == false)==true?0:5,
      /*"5.1": computerInStock==true?0:5,
      "5.2": pinPad==true?0:5,
      "5.3": scale==true?0:5,
      "5.4": scanner==true?0:5,
      "5.5": printer==true?0:5,
      "5.6": handScanner==true?0:5,
      "5.7": cashDrawer==true?0:5,
      "5.8": mounts==true?0:5,
      "5.9": zyWall==true?0:5,*/
      "6": training==true?0:5,
      "7": backOfficeSetup==true?0:5,
      "8": (productTemplate == false ||
          pictureUPC == false ||
          picture002 == false ||
          pictureEAN == false)==true?0:5,
      /*"8.1": productTemplate==true?0:5,
      "8.2": pictureUPC==true?0:5,
      "8.3": pictureEAN==true?0:5,
      "8.4": picture002==true?0:5,*/
      "9": finalPayment==true?0:5,
      /*"10": equipmentPayment==true?0:5,*/
      "10": install==true?0:5,
      "11": trainingGoLive==true?0:5
    };
    print(levels);
  }

  addUser() async {
    await createMap();
    await createCRFIntMap();
    
    Map<String, String> params = {
      'name': Global.newUserName,
      "email": Global.newUserEmail,
      "password": Global.newUserPassword,
      "contact": Global.newUserContact,
      "type": "0",
      "address": Global.newUserAddress,
      "pincode": Global.newUserPinCode,
      "crf":cRF.toString(),
      "levels":levels.toString()
    };

    await http.post(APIs.addCustomer, body: params).then((value) {
      print(value.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Customer Requirement Form",
                  style: TextStyle(
                      fontSize: 50,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor),
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringOnBoardingQuestionnaire,
                  value: onBoardingQuestionnaire,
                  onChanged: (value) {
                    onBoardingQuestionnaire = value;
                  },
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringMerchantInfo,
                  value: merchantInfo,
                  onChanged: (value) {
                    merchantInfo = value;
                  },
                ),
              ),
              Card(
                child: Column(
                  children: [
                    CustomCheckTile(
                      title: stringHardwareInfo,
                      value: hardwareInfo,
                      onChanged: (value) {
                        hardwareInfo = value;

                        if (hardwareInfo == true) {
                          contractBringYourOwnHardware = true;
                          pictureAllPorts = true;
                          pictureScale = true;
                          pictureScanner = true;
                          picturePrinter = true;
                          requirementList
                              .add(stringContractBringYourOwnHardware);
                          requirementList.add(stringPictureAllPorts);
                          requirementList.add(stringPictureScale);
                          requirementList.add(stringPictureScanner);
                          requirementList.add(stringPicturePrinter);
                        } else if (hardwareInfo == false) {
                          contractBringYourOwnHardware = false;
                          pictureAllPorts = false;
                          pictureScale = false;
                          pictureScanner = false;
                          picturePrinter = false;
                          requirementList
                              .remove(stringContractBringYourOwnHardware);
                          requirementList.remove(stringPictureAllPorts);
                          requirementList.remove(stringPictureScale);
                          requirementList.remove(stringPictureScanner);
                          requirementList.remove(stringPicturePrinter);
                        }

                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringContractBringYourOwnHardware,
                      value: contractBringYourOwnHardware,
                      onChanged: (value) {
                        contractBringYourOwnHardware = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPictureAllPorts,
                      value: pictureAllPorts,
                      onChanged: (value) {
                        pictureAllPorts = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPictureScale,
                      value: pictureScale,
                      onChanged: (value) {
                        pictureScale = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPictureScanner,
                      value: pictureScanner,
                      onChanged: (value) {
                        pictureScanner = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPicturePrinter,
                      value: picturePrinter,
                      onChanged: (value) {
                        picturePrinter = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringStorePicture,
                  value: storePicture,
                  onChanged: (value) {
                    storePicture = value;
                    setState(() {});
                  },
                ),
              ),
              Card(
                child: Column(
                  children: [
                    CustomCheckTile(
                      title: stringProcessOrder,
                      value: processOrder,
                      onChanged: (value) {
                        processOrder = value;

                        if (processOrder == true) {
                          computerInStock = true;
                          pinPad = true;
                          scale = true;
                          scanner = true;
                          printer = true;
                          handScanner = true;
                          cashDrawer = true;
                          mounts = true;
                          zyWall = true;
                          requirementList.add(stringComputerInStock);
                          requirementList.add(stringPinPad);
                          requirementList.add(stringScale);
                          requirementList.add(stringScanner);
                          requirementList.add(stringPrinter);
                          requirementList.add(stringHandScanner);
                          requirementList.add(stringCashDrawer);
                          requirementList.add(stringMounts);
                          requirementList.add(stringZyWall);
                        } else if (processOrder == false) {
                          computerInStock = false;
                          pinPad = false;
                          scale = false;
                          scanner = false;
                          printer = false;
                          handScanner = false;
                          cashDrawer = false;
                          mounts = false;
                          zyWall = false;
                          requirementList.add(stringComputerInStock);
                          requirementList.add(stringPinPad);
                          requirementList.add(stringScale);
                          requirementList.add(stringScanner);
                          requirementList.add(stringPrinter);
                          requirementList.add(stringHandScanner);
                          requirementList.add(stringCashDrawer);
                          requirementList.add(stringMounts);
                          requirementList.add(stringZyWall);
                        }

                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringComputerInStock,
                      value: computerInStock,
                      onChanged: (value) {
                        computerInStock = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPinPad,
                      value: pinPad,
                      onChanged: (value) {
                        pinPad = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringScale,
                      value: scale,
                      onChanged: (value) {
                        scale = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringScanner,
                      value: scanner,
                      onChanged: (value) {
                        scanner = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPrinter,
                      value: printer,
                      onChanged: (value) {
                        printer = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringHandScanner,
                      value: handScanner,
                      onChanged: (value) {
                        handScanner = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringCashDrawer,
                      value: cashDrawer,
                      onChanged: (value) {
                        cashDrawer = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringMounts,
                      value: mounts,
                      onChanged: (value) {
                        mounts = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringZyWall,
                      value: zyWall,
                      onChanged: (value) {
                        zyWall = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringTraining,
                  value: training,
                  onChanged: (value) {
                    training = value;
                    setState(() {});
                  },
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringBackOfficeSetup,
                  value: backOfficeSetup,
                  onChanged: (value) {
                    backOfficeSetup = value;
                    setState(() {});
                  },
                ),
              ),
              Card(
                child: Column(
                  children: [
                    CustomCheckTile(
                      title: stringProductFile,
                      value: productFile,
                      onChanged: (value) {
                        productFile = value;

                        if (productFile == true) {
                          productTemplate = true;
                          pictureUPC = true;
                          picture002 = true;
                          pictureEAN = true;
                        } else if (productFile == false) {
                          productTemplate = false;
                          pictureUPC = false;
                          picture002 = false;
                          pictureEAN = false;
                        }
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringProductTemplate,
                      value: productTemplate,
                      onChanged: (value) {
                        productTemplate = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPictureUPC,
                      value: pictureUPC,
                      onChanged: (value) {
                        pictureUPC = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPictureEAN,
                      value: pictureEAN,
                      onChanged: (value) {
                        pictureEAN = value;
                        setState(() {});
                      },
                    ),
                    CustomSubCheckTile(
                      title: stringPicture002,
                      value: picture002,
                      onChanged: (value) {
                        picture002 = value;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringFinalPayment,
                  value: finalPayment,
                  onChanged: (value) {
                    finalPayment = value;
                    setState(() {});
                  },
                ),
              ),
              /* Card(
                child: CustomCheckTile(
                  title: stringEquipmentPayment,
                  value: equipmentPayment,
                  onChanged: (value) {
                    equipmentPayment = value;
                    setState(() {});
                  },
                ),
              ),*/
              Card(
                child: CustomCheckTile(
                  title: stringInstall,
                  value: install,
                  onChanged: (value) {
                    install = value;
                    setState(() {});
                  },
                ),
              ),
              Card(
                child: CustomCheckTile(
                  title: stringTrainingGoLive,
                  value: trainingGoLive,
                  onChanged: (value) {
                    trainingGoLive = value;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(
                      title: "CANCEL",
                      titleclr: Whitecolor,
                      bgclr: Lightgreycolor,
                      click: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Custombuttongreen(
                      title: "REGISTER CUSTOMER",
                      titleclr: Whitecolor,
                      bgclr: Greencolor,
                      click: () {
                        addUser();

                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckTile extends StatefulWidget {
  bool value;
  final String title;
  VoidCallback onTrue;
  VoidCallback onFalse;
  Function(bool) onChanged;

  CustomCheckTile(
      {this.value, this.title, this.onTrue, this.onFalse, this.onChanged});

  @override
  _CustomCheckTileState createState() => _CustomCheckTileState();
}

class _CustomCheckTileState extends State<CustomCheckTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 800,
        child: CheckboxListTile(
          checkColor: Colors.white,
          activeColor: Greencolor,
          title: Text(widget.title),
          value: widget.value,
          onChanged: (bool value) {
            if (value == true) {
              widget.value = true;

              //print(hardwareInfo);
              requirementList.add(widget.title);
              if (widget.onTrue != null) {
                widget.onTrue();
              }
            } else if (value == false) {
              widget.value = false;
              //print(hardwareInfo);
              requirementList.remove(widget.title);
              if (widget.onFalse != null) {
                widget.onFalse();
              }
            }

            widget.onChanged(widget.value);
            /*   print(requirementList);*/

            setState(() {});
          },
          //secondary: const Icon(Icons.hourglass_empty),
        ),
      ),
    );
  }
}

class CustomSubCheckTile extends StatefulWidget {
  bool value;
  final String title;
  VoidCallback onTrue;
  VoidCallback onFalse;
  Function(bool) onChanged;

  CustomSubCheckTile({
    this.value,
    this.title,
    this.onChanged,
    this.onFalse,
    this.onTrue,
  });

  @override
  _CustomSubCheckTileState createState() => _CustomSubCheckTileState();
}

class _CustomSubCheckTileState extends State<CustomSubCheckTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 800,
        child: Row(
          children: [
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Card(
                color: Colors.grey[200],
                child: CheckboxListTile(
                  checkColor: Colors.white,
                  activeColor: Greencolor,
                  title: Text(widget.title),
                  value: widget.value,
                  onChanged: (bool value) {
                    if (value == true) {
                      widget.value = true;
                      requirementList.add(widget.title);
                    } else if (value == false) {
                      widget.value = false;
                      requirementList.remove(widget.title);
                    }

                    widget.onChanged(widget.value);

                    if (contractBringYourOwnHardware == false ||
                        pictureAllPorts == false ||
                        pictureScale == false ||
                        pictureScanner == false ||
                        picturePrinter == false) {
                      hardwareInfo = false;
                      requirementList.remove(stringHardwareInfo);
                    }

                    /*print(hardwareInfo);
                    print(requirementList);*/
                    if (computerInStock == false ||
                        pinPad == false ||
                        scale == false ||
                        scanner == false ||
                        printer == false ||
                        handScanner == false ||
                        cashDrawer == false ||
                        mounts == false ||
                        zyWall == false) {
                      processOrder = false;
                    }

                    if (productTemplate == false ||
                        pictureUPC == false ||
                        picture002 == false ||
                        pictureEAN == false) {
                      productFile = false;
                    }
                    setState(() {});
                  },
                  //secondary: const Icon(Icons.hourglass_empty),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
