import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Global/vars.dart';

class CustomerRequirement extends StatefulWidget {
  @override
  _CustomerRequirementState createState() => _CustomerRequirementState();
}

class _CustomerRequirementState extends State<CustomerRequirement> {

  String stringOnBoardingQuestionnaire ="Onboarding Questionnaire" ;
  String stringMerchantInfo = "Merchant Information (ISO must supply VAR Sheet or we supply (VAR Sheet)";
  String stringHardwareInfo= "Hardware Requirements";
  String stringContractBringYourOwnHardware= "Contract – Bring your own Hardware";
  String stringPictureAllPorts= "Picture - Back of Computer all ports";
  String stringPictureScale= "Picture - Scale (Model Number, Cables)";
  String stringPictureScanner= "Picture - Scanner (Model Number, Cables)";
  String stringPicturePrinter= "Picture - Printer (Model Number, Cables)";
  String stringStorePicture= "Store Pictures (Examples)";
  String stringProcessOrder= "Process Order - Order Hardware & Enter tracking info (note: from our supplier or from our office)";
  String stringComputerInStock= "Computer (Instock)";
  String stringPinPad= "Pin Pad & Cables (Supplier Encrypts)";
  String stringScale= "Scale & Cables ";
  String stringScanner= "Scanner & Cables – Hand Scanner, Cash Drawer, Mounts , Zywall instock)";
  String stringPrinter= "Printer & Cables";
  String stringHandScanner= "Hand Scanner";
  String stringCashDrawer= "Cash Drawer";
  String stringMounts= "Mounts";
  String stringZyWall= "Zywall";
  String stringTraining= "Training (Back office and Front End – Watch Videos)";
  String stringBackOfficeSetup= "Back Office Setup (Taxes, Departments, Vendors, Employees, Fees  … Link to BO with User & PW,)";
  String stringProductFile= "Product File (Emily Sends Template) Download a CSV Template with Video how to use)";
  String stringProductTemplate= "Product Template";
  String stringPictureUPC= "Picture - what a UPC A barcode is ";
  String stringPictureEAN= "Picture - what a EAN barcode is ";
  String stringPicture002= "Picture what a 002 barcode is ";
  String stringFinalPayment= "Final Payment ";
  String stringEquipmentPayment= "Equipment Shipped! Enter Tracking from Office to the Cust; Tracking from supplier s/b entered.";
  String stringInstall= "Install ";
  String stringTrainingGoLive= "Training and Go live";
  bool onBoardingQuestionnaire=false;
  bool merchantInfo=false;
  bool hardwareInfo=false;
  bool contractBringYourOwnHardware=false;
  bool pictureAllPorts=false;
  bool pictureScale=false;
  bool pictureScanner=false;
  bool picturePrinter=false;
  bool storePicture=false;
  bool processOrder=false;
  bool computerInStock=false;
  bool pinPad=false;
  bool scale=false;
  bool scanner=false;
  bool printer=false;
  bool handScanner=false;
  bool cashDrawer=false;
  bool mounts=false;
  bool zyWall=false;
  bool training=false;
  bool backOfficeSetup=false;
  bool productFile=false;
  bool productTemplate=false;
  bool pictureUPC=false;
  bool pictureEAN=false;
  bool picture002=false;
  bool finalPayment=false;
  bool equipmentPayment=false;
  bool install=false;
  bool trainingGoLive=false;



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
                      fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor),
                ),
              ),
              CustomCheckTile(
                title: stringOnBoardingQuestionnaire,
                value: onBoardingQuestionnaire,
              ),
              CustomCheckTile(
                title: stringMerchantInfo,
                value: merchantInfo,
              ),
              CustomCheckTile(
                title: stringHardwareInfo,
                value: hardwareInfo,
              ),
              CustomCheckTile(
                title: stringContractBringYourOwnHardware,
                value: contractBringYourOwnHardware,
              ),
              CustomCheckTile(
                title: stringPictureAllPorts,
                value: pictureAllPorts,
              ),
              CustomCheckTile(
                title: stringPictureScale,
                value: pictureScale,
              ),
              CustomCheckTile(
                title: stringPictureScale,
                value: pictureScale,
              ),
              CustomCheckTile(
                title: stringPictureScanner,
                value: pictureScanner,
              ),
              CustomCheckTile(
                title: stringPicturePrinter,
                value: picturePrinter,
              ),
              CustomCheckTile(
                title: stringStorePicture,
                value: storePicture,
              ),
              CustomCheckTile(
                title: stringProcessOrder,
                value: processOrder,
              ),
              CustomCheckTile(
                title: stringComputerInStock,
                value: computerInStock,
              ),
              CustomCheckTile(
                title: stringPinPad,
                value: pinPad,
              ),
              CustomCheckTile(
                title: stringScale,
                value: scale,
              ),
              CustomCheckTile(
                title: stringPictureScanner,
                value: scanner,
              ),
              CustomCheckTile(
                title: stringPrinter,
                value: printer,
              ),
              CustomCheckTile(
                title: stringHandScanner,
                value: handScanner,
              ),
              CustomCheckTile(
                title: stringCashDrawer,
                value: cashDrawer,
              ),
              CustomCheckTile(
                title: stringMounts,
                value: mounts,
              ),
              CustomCheckTile(
                title: stringZyWall,
                value: zyWall,
              ),
              CustomCheckTile(
                title: stringTraining,
                value: training,
              ),
              CustomCheckTile(
                title: stringBackOfficeSetup,
                value: backOfficeSetup,
              ),
              CustomCheckTile(
                title: stringProductTemplate,
                value: productFile,
              ),
              CustomCheckTile(
                title: stringProductTemplate,
                value: productTemplate,
              ),
              CustomCheckTile(
                title: stringPictureUPC,
                value: pictureUPC,
              ),
              CustomCheckTile(
                title: stringPictureEAN,
                value: pictureEAN,
              ),
              CustomCheckTile(
                title: stringPicture002,
                value: picture002,
              ),
              CustomCheckTile(
                title: stringFinalPayment,
                value: finalPayment,
              ),
              CustomCheckTile(
                title: stringEquipmentPayment,
                value: equipmentPayment,
              ),
              CustomCheckTile(
                title: stringInstall,
                value: install,
              ),
              CustomCheckTile(
                title: stringTrainingGoLive,
                value: trainingGoLive,
              ),
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



  CustomCheckTile({this.value, this.title,});

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
          title:  Text(widget.title),
          value: widget.value,
          onChanged: (bool value){


             if(value==true)
             {
               widget.value=true;
               requirementList.add(widget.title);
             }
             else if(value ==false)
             {
               widget.value = false;
               requirementList.remove(widget.title);
             }
             print(requirementList );
             print(value);
             setState(() {
           });

          },
          //secondary: const Icon(Icons.hourglass_empty),
        ),
      ),
    );
  }
}

