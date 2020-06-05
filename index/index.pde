ArrayList Connections = new ArrayList();
Star s1 = new Star("Deneb", 1086.88, 31.28, 38.49);
Star s2 = new Star("Gamma", 1057.47, 2.36, -14.80);
Star s3 = new Star("Epsilon", -387.32,  38.45, -66.89);

void setup() {
  size(800,800);

  Star[] c1 = {s1, s2};
  Star[] c2 = {s2, s3};
  
 
  Connections.add(c1);
  Connections.add(c2);
}

void draw() {
  float ra = PI/8;
  float dec= 0;
  scale(1, -1);
  translate(width/2, -height/2);
  background(0,0,55);
  stroke(255);
  s1.update(ra, dec);
  s2.update(ra, dec);
  s3.update(ra, dec);
  line(s1.updown, s1.leftright,
        s2.updown, s2.leftright);
  line(s3.updown, s3.leftright,
        s2.updown, s2.leftright);
}
