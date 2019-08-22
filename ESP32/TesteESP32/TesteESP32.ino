void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  //Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println(random(1,10));
  //Serial.print("Programa executando");
  delay(100);
}
