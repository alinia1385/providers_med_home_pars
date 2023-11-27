import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/feature/profile/controller/profile_controller.dart';

class Clinic extends StatelessWidget
{
  const Clinic({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcName,
              maxLength: 100,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("نام کلینیک"),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcPhone1,
              maxLength: 11,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("شماره تماس 1 "),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcPhone2,
              maxLength: 11,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("شماره تماس 2 "),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcAddress,
              maxLength: 200,
              keyboardType: TextInputType.text,

              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("ادرس  "),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcOwnerName,
              maxLength: 20,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("نام کلینیک"),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcOwnerSurname,
              maxLength: 20,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("نام کلینیک"),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcOwnerMobile,
              maxLength: 11,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("موبایل"),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tcOwnerDesc,
              maxLength: 200,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConst.primaryDark),
                ),
                hintText: ("نام کلینیک"),
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ColorConst.primaryDark,
                    fontFamily: "IRANSANCE"),
              ),
            )),
      ],
    );
  }

}