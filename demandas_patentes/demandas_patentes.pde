import de.bezier.data.sql.*;
SQLite db;

String[] demandados = new String[0];

void setup(){
  size(800, 600);
  db = new SQLite(this, "demandas_patentes_full.db");
  ellipseMode(RADIUS);
  smooth();
 
}

void draw(){
   background(255);
   noFill();
   fill(0);
   ellipse(width/2, height/2, 25, 25);
   if(db.connect()){
    db.query("SELECT * FROM casos WHERE source = \"Apple\" ");
     while(db.next()){
       float posx = map(db.getFloat("posx"), 0.0, 1.0, 0.0 , width);
       float posy = map(db.getFloat("posy"), 0.0, 1.0, 0.0, height);
       strokeWeight(3);
       stroke(0);
       line(width/2, height/2, posx, posy);
       fill(255);
       ellipse(posx, posy, 15, 15);
     }
   }
  noLoop();
}


