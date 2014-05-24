import de.bezier.data.sql.*;

SQLite db;

//lista vacia para guardar los valores
float[] crecimiento = new float[0];
int index = 0;
void setup(){
  size(800, 800);
  //crea la conexion con la base de datos
  db = new SQLite(this, "deuda-crecimiento.db");
  if(db.connect()){
    //realiza una peticion a la bd usando sql
    db.query("SELECT * FROM todo where SeriesCode = \"NY.GDP.MKTP.KD.ZG\" ORDER BY Time ASC");
    
    //avanza por todos los registros, leyendolos y guardandolos en el array crecimiento
    while(db.next()){
      
      float c = db.getFloat("ARG");
      println(c);
      //si no es un numero (porque el campo esta vacio), lo guardamos en la base de datos
      if(Float.isNaN(c)){
        println("El campo esta vacio");
      }else{
        crecimiento = append(crecimiento, c);
      }
    }
  }
  
  ellipseMode(CENTER);
  frameRate(5);
}

void draw(){
  background(255);
  noStroke();
  fill(0);
  
  //usamos el crecimiento como el alto del rectangulo
  //el valor viene sin escalar
  
  //float radio = crecimiento[index]
  
  //este valor viene escalado
  float min = min(crecimiento);
  float max = max(crecimiento);
  
  //mapeamos el min y max al maximo y minimo deseado para el radio
  float radio = map(crecimiento[index], min, max,  200, 600 );
  
  //finalmente dibujamos los rectangulos
  ellipse(width/2, height/2, radio, radio);
  
  if(index == crecimiento.length - 1){
    index = 0;
  }else{
    index++;
  }
}

