import de.bezier.data.sql.*;

SQLite db;

//lista vacia para guardar los valores
float[] crecimiento = new float[0];

void setup(){
  size(800, 300);
  //crea la conexion con la base de datos
  db = new SQLite(this, "deuda-crecimiento.db");
  if(db.connect()){
    //realiza una peticion a la bd usando sql
    db.query("SELECT * FROM todo WHERE SeriesCode = \"NY.GDP.MKTP.KD.ZG\" ORDER BY Time ASC");
    
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
}

void draw(){
  background(255);
  noStroke();
  fill(0);
  //dividimos la pantalla en partes iguales, convertimos a entero
  int w = int(width / crecimiento.length);
  
  //iteramos sobre la lista de datos
  //dibujando las barras usando los datos como altura
  for(int i = 0; i < crecimiento.length; i++){
    int posx = i * w;
    //usamos el crecimiento como el alto del rectangulo
    //el valor viene sin escalar
    
    //float alto = crecimiento[i]
    
    //este valor viene escalado
    float min = min(crecimiento);
    float max = max(crecimiento);
    
    //mapeamos el min y max a los puntos mas bajos y altos del canvas
    //dejando 30 pixeles de margen arriba y abajo.
    float alto = map(crecimiento[i], min, max,  height/2, -height/2 );
    
    //finalmente dibujamos los rectangulos
    rect(posx, height/2, w, alto);
  }
}

