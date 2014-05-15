String[] lines;

void setup(){
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

void draw(){
	background(200);
	noStroke();
	color[] colors = { 
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
		float[] vals = float(split(lines[i], '\t'));
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