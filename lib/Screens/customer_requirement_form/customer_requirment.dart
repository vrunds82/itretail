import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Global/vars.dart';
import 'package:itretail/Screens/Questions_Screens/Product_File.dart';

class CustomerRequirement extends StatefulWidget {
  @override
  _CustomerRequirementState createState() => _CustomerRequirementState();
}

class _CustomerRequirementState extends State<CustomerRequirement> {

  String stringOnBoardingQuestionnaire ="1. Onboarding Questionnaire" ;
  String stringMerchantInfo = "2. Merchant Information (ISO must supply VAR Sheet or we supply (VAR Sheet)";
  String stringHardwareInfo= "3. Hardware Requirements";
  String stringContractBringYourOwnHardware= "4. Contract – Bring your own Hardware";
  String stringPictureAllPorts= "5. Picture - Back of Computer all ports";
  String stringPictureScale= "6. Picture - Scale (Model Number, Cables)";
  String stringPictureScanner= "7. Picture - Scanner (Model Number, Cables)";
  String stringPicturePrinter= "8. Picture - Printer (Model Number, Cables)";
  String stringStorePicture= "9. Store Pictures (Examples)";
  String stringProcessOrder= "10. Process Order - Order Hardware & Enter tracking info (note: from our supplier or from our office)";
  String stringComputerInStock= "11. Computer (Instock)";
  String stringPinPad= "12. Pin Pad & Cables (Supplier Encrypts)";
  String stringScale= "13. Scale & Cables ";
  String stringScanner= "14. Scanner & Cables – Hand Scanner, Cash Drawer, Mounts , Zywall instock)";
  String stringPrinter= "15. Printer & Cables";
  String stringHandScanner= "16. Hand Scanner";
  String stringCashDrawer= "17. Cash Drawer";
  String stringMounts= "18. Mounts";
  String stringZyWall= "19. Zywall";
  String stringTraining= "20. Training (Back office and Front End – Watch Videos)";
  String stringBackOfficeSetup= "21. Back Office Setup (Taxes, Departments, Vendors, Employees, Fees  … Link to BO with User & PW,)";
  String stringProductFile= "22. Product File (Emily Sends Template) Download a CSV Template with Video how to use)";
  String stringProductTemplate= "23. Product Template";
  String stringPictureUPC= "24. Picture - what a UPC A barcode is ";
  String stringPictureEAN= "25. Picture - what a EAN barcode is ";
  String stringPicture002= "26. Picture what a 002 barcode is ";
  String stringFinalPayment= "27. Final Payment ";
  String stringEquipmentPayment= "28. Equipment Shipped! Enter Tracking from Office to the Cust; Tracking from supplier s/b entered.";
  String stringInstall= "29. Install ";
  String stringTrainingGoLive= "30. Training and Go live";
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
                title: stringScanner,
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
                title: stringProductFile,
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

