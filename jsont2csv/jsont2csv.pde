/*
Sketch para crear un csv desde un json con la data para la db
*/
 
void setup(){
  size(100,100);
  JSONArray cases = loadJSONArray("cases.json");
  PrintWriter out = createWriter("data/cases_full.csv");
  out.println("source,target,type, posx, poxy");
     
  for(int i = 0; i < cases.size(); i++){
    float posx = random(0,1);
    float posy = random(0,1);
    JSONObject caso = cases.getJSONObject(i);
    String linea = caso.getString("source") + "," + caso.getString("target") + "," + caso.getString("type") + "," + posx + "," + posy;
    out.println(linea);
    println(caso.getString("source"));
  }    
  out.flush();
  out.close();
}
