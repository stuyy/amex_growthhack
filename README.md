# INSTRUCTIONS

1) Clone Repository

2) Go to Google Developer Console, enable Google Maps for Android, and get an API key.

3) Go to /android/app/src/main/AndroidManifest.xml and look for

```
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="" />
```

Place your api key where it says `android:value="YOUR API KEY"`

*Note: This only works for Android*

If trying to run on iOS, you must follow the instructions here for iOS:

https://pub.dev/packages/google_maps_flutter

# To install dependencies:

```flutter pub get```
