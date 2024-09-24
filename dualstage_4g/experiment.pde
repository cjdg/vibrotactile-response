
public synchronized void  runExperiment(){
  btn_20hz.setVisible(false);
  btn_36hz.setVisible(false);
  btn_44hz.setVisible(false);
  btn_80hz.setVisible(false);
  btn_start.setVisible(false);
  btn_stop.setVisible(true);
  int[] frequenciesList = getFreqList();
  for(int i = 0; i < frequenciesList.length; i++){
    if(expCancelled){
      println("Cancelled");
      btn_20hz.setVisible(true);
      btn_36hz.setVisible(true);
      btn_44hz.setVisible(true);
      btn_80hz.setVisible(true);
      btn_start.setVisible(true);
      btn_stop.setVisible(false);
      expCancelled = false;
      return;
    }
    vibrFreq = frequenciesList[i];
    vibrate();
    delay(expInterval);
    println("x");
  }
    btn_20hz.setVisible(true);
  btn_36hz.setVisible(true);
  btn_44hz.setVisible(true);
  btn_80hz.setVisible(true);
  btn_start.setVisible(true);
  btn_stop.setVisible(false);
}
