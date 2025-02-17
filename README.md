# OruPhones 

## Find the .apk files [here](apks).
## Watch the video [here](https://drive.google.com/file/d/157MSyVck4z8nh3oZtvechT5VBVozE8bS/view?usp=sharing).

## Features that I successfully implemented in the application:
* The scrolling behavior on the Home Screen is same as the current OruPhones App in Google Play Store.
* Users enter their phone number, generates otp via `otpCreate` endpoint and OTP validation is via `otpValidate` endpoint has been implemented. 
* Data of all the displayed products has been fetched from the server using `filter` endpoint without providing any filter.
* All the brands data has been fetched from the server using the `makeWithImages` endpoint.
* All the faqs' data has been fetched from the server using `faq` endpoint.
* Users can like/unlike any product.
* Share functionality on multiple platforms(Instagram, Telegram, Twitter, Whatsapp). The respective apps open with content auto selected to share via post/story/message.
 
## Features that I failed to implement in the application due to shortage of time:
* Product Cards and Pagination
* Firebase Push Notifications.
* Auth State saving.

## Tools used:
* **State Management**
    * [Stacked](https://stacked.filledstacks.com/)
* **HTTP requests**
    * [http](https://pub.dev/packages/http)

## Steps to set up the application .apk file:
1. Go to the [apks folder](apks).
2. Download the apk that is supported by your android architecture, or, download the apk file that supports all the architectures.
3. Install the apk file on your device.
4. Test the application.

## Steps to run the source code of the application:
1. Download [Flutter](https://docs.flutter.dev/get-started/install?_gl=1*w007dg*_gcl_aw*R0NMLjE3Mzg0NDI3ODIuQ2p3S0NBaUFxZmU4QmhCd0Vpd0FzbmU2Z2FUNkRuU1QzZFJ0djlla2xpdl9jUDQzdjN4c2p3allob0dndmhVZjljZ0h3SkhPcUlma2h4b0NqeDBRQXZEX0J3RQ..*_gcl_dc*R0NMLjE3Mzg0NDI3ODIuQ2p3S0NBaUFxZmU4QmhCd0Vpd0FzbmU2Z2FUNkRuU1QzZFJ0djlla2xpdl9jUDQzdjN4c2p3allob0dndmhVZjljZ0h3SkhPcUlma2h4b0NqeDBRQXZEX0J3RQ..*_ga*MTYzMDQ3NzI5MC4xNzE3NTkyNzE0*_ga_04YGWK0175*MTczOTQ4MDk0OC4xNTguMS4xNzM5NDgyMjA5LjAuMC4w) and [Android Studio](https://developer.android.com/studio?gad_source=1&gclid=CjwKCAiAzba9BhBhEiwA7glbapqeW52Yn4htY-uwmd15rR7AXAWfggq9ogg_5Zd2Lrrdw5Kotg-jYxoCRoYQAvD_BwE&gclsrc=aw.ds).
2. Download the .zip file of the source code this repository.<br>
    Or, simply use the following git command to clone the repository on your system:
    ```bash
    git clone https://github.com/tapoban123/oruplus-assignment.git
    ```

3. Once you have the required softwares and the source code on your system, navigate to the project folder via terminal and run the following command:
   ```bash
   flutter pub get
   ```
   This command will install all the necessary packages used in the project.
 4 Run the flutter project in release mode using the following command on your terminal:
    ```bash
    flutter run --release
    ```