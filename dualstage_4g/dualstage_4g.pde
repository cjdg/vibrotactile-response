import g4p_controls.*;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.Arrays;
import java.lang.*;
import cc.arduino.*;
import org.firmata.*;
import processing.serial.*;
import java.util.logging.Logger;

//connections
int vibr = 3;
int outSignal = 9;

//variables
boolean arduinoIsConnected = false;
boolean vibrMotorBusy = false;
boolean expRunning = false;
boolean expCancelled = false;
int vibrFreq = 0;
int vibrDuration = 1000;
int expInterval = 2000;

//objects
Arduino ardu;
Logger logger;

public void setup(){
  size(800, 400, JAVA2D);
  createGUI();
  customGUI();
  
  logger = Logger.getLogger("dualstage_4g");
}

public void draw(){
  background(230);
  logger.info("hola");
  
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){
  btn_stop.setVisible(false);
  btn_start.setVisible(false);
  fld_freqs.setText("22,33,44");
  fld_duration.setText(String.valueOf(vibrDuration));
  fld_exp_interval.setText(String.valueOf(expInterval));
  btn_20hz.setVisible(false);
  btn_36hz.setVisible(false);
  btn_44hz.setVisible(false);
  btn_80hz.setVisible(false);
  surface.setTitle("dualStage_4g");
}
