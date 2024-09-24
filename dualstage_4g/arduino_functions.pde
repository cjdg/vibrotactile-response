
void connectArduino(){
  if(ardu != null){
    ardu.dispose();
    
  }
  ardu = new Arduino(this, Arduino.list()[lst_ports.getSelectedIndex()], 57600);
  ardu.pinMode(vibr, Arduino.OUTPUT);
  ardu.pinMode(outSignal, Arduino.OUTPUT);
 
  //This make arduino signal an ok connection
  delay(1000);
  ardu.digitalWrite(10,Arduino.HIGH);
  delay(100);
  ardu.digitalWrite(10,Arduino.LOW);
  delay(100);
  ardu.digitalWrite(10,Arduino.HIGH);
  delay(100);
  ardu.digitalWrite(10,Arduino.LOW);
  lbl_status.setText("connected!");
  btn_start.setVisible(true);
  btn_20hz.setVisible(true);
  btn_36hz.setVisible(true);
  btn_44hz.setVisible(true);
  btn_80hz.setVisible(true);
}

//Motor functions
public synchronized void vibrate(){
  vibrMotorBusy = true;
  int freq = vibrFreq;
  int duration = vibrDuration;
  int startTime = 0;
  int stopTime = 0;
  int onTime = 0;
  int offTime = 0;
  int driftTime = 0;
  
  println("RUN:freq "+ freq +",dur " +duration);
  
  if ((freq > 0)&&(freq<41))  {
    println("Freq:1-40");
    onTime = 15;
    offTime = (1000/freq)-onTime;
  } else if((freq>40)&&(freq<80)){
    println("freq:40-80");
    onTime = 10;
    offTime = (1000/freq)-onTime;
  }
  if (freq == 36) {
    driftTime = 10;
  }
 
  startTime = millis();
  stopTime = millis() + (duration - driftTime);
  
  while(millis() < stopTime){
   ardu.digitalWrite(vibr,Arduino.HIGH);
   ardu.digitalWrite(outSignal,Arduino.HIGH);
   delay(onTime);
   ardu.digitalWrite(vibr,Arduino.LOW);
   ardu.digitalWrite(outSignal,Arduino.LOW);
   delay(offTime);
  }
  println("Elapsed:" + duration);
  
  vibrMotorBusy = false;
}
