import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/const/color.dart';
import 'package:note_app/feature/profile/controller/profile_controller.dart';

class DoctorTherapist extends StatelessWidget
{
  const DoctorTherapist({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tName,
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
                hintText: ("نام"),
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
            controller: ProfileController.to.tFamily,
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
              hintText: ("نام خانوادگی"),
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: ColorConst.primaryDark,
                  fontFamily: "IRANSANCE"),
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: TextFormField(
              controller: ProfileController.to.tMsn,
              maxLength: 10,
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
                hintText: ("کد نظام پزشکی"),
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
              controller: ProfileController.to.tSpecialty,
              maxLength: 50,
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
                hintText: ("تخصص"),
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
              controller: ProfileController.to.tAge,
              maxLength: 2,
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
                hintText: ("سن"),
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
              controller: ProfileController.to.tMobile,
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
              controller: ProfileController.to.tAddress,
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
              controller: ProfileController.to.tPhone1,
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
              controller: ProfileController.to.tPhone2,
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
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: ColorConst.primaryDark,
                      onChanged: (value) {

                        ProfileController.to.woman.value = true;

                        ProfileController.to.man.value = false;

                      },
                      value: ProfileController.to.woman.value,
                      // ProfileController.to.woman.value,
                      side: const BorderSide(
                        color: ColorConst.primaryDark,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Text("خانم",
                        style: TextStyle(
                            fontFamily: "IRANSANCE", fontSize: 14))
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: ColorConst.primaryDark,
                        onChanged: (value) {
                          ProfileController.to.man.value = true;
                          if (value!) {
                            ProfileController.to.woman.value = false;
                          }
                        },
                        value:  ProfileController.to.man.value,
                        // ProfileController.to.man.value,
                        side: const BorderSide(
                          color: ColorConst.primaryDark,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const Text(
                        "آقا",
                        style: TextStyle(
                            fontFamily: "IRANSANCE", fontSize: 14),
                      )
                    ],
                  )),
              const Expanded(
                child: Text(":جنسیت",
                    style: TextStyle(
                        fontFamily: "IRANSANCE", fontSize: 16)),
              )
            ],
          ),
        ),
      ],
    );
  }

}