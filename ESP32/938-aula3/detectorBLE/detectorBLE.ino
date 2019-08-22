/*
   Based on Neil Kolban example for IDF: https://github.com/nkolban/esp32-snippets/blob/master/cpp_utils/tests/BLE%20Tests/SampleScan.cpp
   Ported to Arduino ESP32 by Evandro Copercini
*/

// --- WIFI ---
#include <WiFi.h>

const char* ssid     = "predio_72";
const char* password = "passpass";

// --- Bluetooth ---
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>
#include <BLEAdvertisedDevice.h>

int scanTime = 5; //In seconds
//int nivelRSSI = -78;
String dispositivosAutorizados = "58:e4:c0:41:2e:b3";


// --- Setup ---
void setup() {
  Serial.begin(115200);
  conectaWifi();
  Serial.println("Scanning...");
  BLEDevice::init("");

}

// -- Funções Auxiliares ---

class MyAdvertisedDeviceCallbacks: public BLEAdvertisedDeviceCallbacks {
    void onResult(BLEAdvertisedDevice advertisedDevice) {
      String dispositivosEncontrados = advertisedDevice.getAddress().toString().c_str();
      if ( dispositivosEncontrados == dispositivosAutorizados  && advertisedDevice.getRSSI() > -78) {
        Serial.println("Identificador DETECTADO!");
        Serial.print("RSSI: ");
        Serial.println(advertisedDevice.getRSSI());
      }


      //Serial.printf("Advertised Device: %s \n", advertisedDevice.getAddress().toString().c_str());
    }
};

// --- Scan Bluetooth LE ---
void scanBLE() {
  BLEScan* pBLEScan = BLEDevice::getScan(); //create new scan
  pBLEScan->setAdvertisedDeviceCallbacks(new MyAdvertisedDeviceCallbacks());
  pBLEScan->setActiveScan(true); //active scan uses more power, but get results faster
  BLEScanResults foundDevices = pBLEScan->start(scanTime);
}

// --- Conecta ao WIFI ---

void conectaWifi() {
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  scanBLE();
  delay(2000);
}
