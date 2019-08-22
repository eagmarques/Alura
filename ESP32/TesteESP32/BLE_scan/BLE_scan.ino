/*
   Based on Neil Kolban example for IDF: https://github.com/nkolban/esp32-snippets/blob/master/cpp_utils/tests/BLE%20Tests/SampleScan.cpp
   Ported to Arduino ESP32 by Evandro Copercini
*/
//--- Wifi ---
#include <WiFi.h>

const char* ssid     = "predio_72";
const char* password = "passpass";
WiFiClient esp32Client;

// --- MQTT ---
#include <PubSubClient.h>

PubSubClient client(esp32Client);
const char* mqtt_Broker = "192.168.0.5";
const char* topic = "laboratorio/iluminacao";
const char* mqtt_ClientID = "esp32";
//const char* mqtt_User = "esp32";
//const char* mqtt_Pass = "passpass";

// --- Bluetooth ---
#include <BLEDevice.h>
#include <BLEUtils.h>
#include <BLEScan.h>
#include <BLEAdvertisedDevice.h>

int scanTime = 5; //In seconds
int RSSIlevel = -78;
String authorizedDevices = "4e:3d:9d:53:8e:54";
BLEScan* pBLEScan;
bool presentDevice = false;

// --- Setup ---
void setup() {
  Serial.begin(115200);
  connectWifi();
  client.setServer(mqtt_Broker, 1883);
  Serial.println("Scanning...");
  BLEDevice::init("");
}

// --- Funções Auxiliares ---
class MyAdvertisedDeviceCallbacks: public BLEAdvertisedDeviceCallbacks {
    void onResult(BLEAdvertisedDevice advertisedDevice) {
      //Serial.printf("Advertised Device: %s \n", advertisedDevice.toString().c_str());
      String foundedDevices = advertisedDevice.getAddress().toString().c_str();
      if (foundedDevices == authorizedDevices && advertisedDevice.getRSSI() > RSSIlevel)
      {
        Serial.println("Device Detected!");
        Serial.print("RSSI: ");
        Serial.println(advertisedDevice.getRSSI());
        Serial.println("Turn ON the light!!!");
        presentDevice = true;
      }
      else
      {
        presentDevice = false;
      }
    }
};

// --- Scan Bluetooth LE ---
void scanBLE() {

  pBLEScan = BLEDevice::getScan(); //create new scan
  pBLEScan->setAdvertisedDeviceCallbacks(new MyAdvertisedDeviceCallbacks());
  pBLEScan->setActiveScan(true); //active scan uses more power, but get results faster
  BLEScanResults foundDevices = pBLEScan->start(scanTime, false);
  Serial.print("Devices found: ");
  Serial.println(foundDevices.getCount());
  Serial.println("Scan done!");
  pBLEScan->clearResults();   // delete results fromBLEScan buffer to release memory
  //pBLEScan->setInterval(100);
  //pBLEScan->setWindow(99);  // less or equal setInterval value

}

//--- Connect to WiFi ---
void connectWifi() {
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

// --- Connect to MQTT ---
void connectMQTT(){
  while(!client.connected()){
    client.connect(mqtt_ClientID);
    }
}

// --- ---
void publishStatusOnTopic(){
  if(presentDevice == 1){
    client.publish(topic, String("On").c_str(), true);
    Serial.println("Power ON");
    }
    else
    {
      client.publish(topic, String("Off").c_str(), true);
      Serial.println("Power OFF");
    }
}

void loop() {
  // put your main code here, to run repeatedly:
  if(!client.connected()){
    connectMQTT();
    }
  scanBLE();
  publishStatusOnTopic();
  delay(2000);
}
