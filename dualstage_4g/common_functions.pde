// This function creates an Array from text field
int[] getFreqList(){
  int[] frequencies = Arrays.stream(fld_freqs.getText().split(",")).mapToInt(Integer::parseInt).toArray();
  return frequencies;
}

void printInfo(String textLog){
  String datetimeText = new String(day()+"/"+month()+"/"+year()+","+hour()+":"+minute()+":"+second()+":"+ millis()+ " ");
  textLog = datetimeText + textLog;
  ta_log.appendText(textLog);
  appendTextToFile("log.txt",textLog);
}

void createFile(File f) {
  File parentDir = f.getParentFile();
  try {
    parentDir.mkdirs(); 
    f.createNewFile();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}

void appendTextToFile(String filename, String text) {
  File f = new File(dataPath(filename));
  if (!f.exists()) {
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}

void openDataFolder() {
  printInfo("INFO:Opening folder:"+dataPath(""));
  if (System.getProperty("os.name").toLowerCase().contains("windows")) {
    println("Running in windows");
    launch("c:\\Windows\\explorer.exe"+" "+dataPath(""));
  } else {
    launch(dataPath(""));
  }
}

void writeTableHeader(String flname)
{
  appendTextToFile(flname, "repeat,freq");
}

void writeSeparator(String flname)
{
  appendTextToFile(flname, "");
}

void addWindowInfo(){
  
}
