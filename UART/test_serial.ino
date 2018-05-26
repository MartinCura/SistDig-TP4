void setup() {
  Serial.begin(115200);

}
int i = 0;
int datos;
void loop() {

  if(Serial.available()>0)
  {
     
      datos = Serial.read();
      //delay(2); 
      Serial.write(datos);
      
    
  }

    
}
