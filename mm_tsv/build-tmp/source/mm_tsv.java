import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class mm_tsv extends PApplet {

String[] lines;

public void setup(){
  size(900, 500);
  lines = loadStrings("MM.tsv");
  ellipseMode(RADIUS);
  // solo para verificar el contenido del archivo
  /*
  for(int i = 0; i < lines.length; i++){
    println(lines[i]);
  }
  */
}

public void draw(){
	background(200);
	noStroke();
	int[] colors = { 
		color(255,0,0), //red
		color(0, 255, 0), //green
		color(0, 0, 255), //blue
		color(255,128, 0), //orange
		color(255,255,0), //yellow
		color(100, 0, 0), //brown
		color(255,255,255) //weight
	};
	//comenzamos por la linea 1, pues la 0 contiene los encabezados de la tabla
	for(int i = 1; i < lines.length; i++){
		float[] vals = PApplet.parseFloat(split(lines[i], '\t'));
		for(int j = 0; j < vals.length; j++){
			fill(colors[j]);
			//print(vals[j]);
			float radius = vals[j];
			float posx = j * 100 + 50;
			float posy = i * 50;
			ellipse(posx, posy, radius, radius);
		}
	}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "mm_tsv" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
