class Star{
  String name;
  float x;
  float y;
  float z;
  float updown;
  float leftright;
  float[] norm;
  float RA;
  float DEC;
  float vdp;
  
  Star(String tName,float tx, float ty, float tz){
   name = tName;
   norm = new float[3];
   x = tx;
   y = ty;
   z = tz;
   updown = 0;
   leftright = 0;
   this.getRA(0.0);
   this.getDEC(0.0);
   this.getNorm();
   this.getvdp();
  }
  
  void getRA(float tRA){
    this.RA = tRA;
  }
  
  void getDEC(float tDEC){
    this.DEC = tDEC;
  }
  
  void getNorm(){
    this.norm[0] = cos(this.RA)*cos(this.DEC);
    this.norm[1] = sin(this.RA)*cos(this.DEC);
    this.norm[2] = sin(this.DEC);
  }
  
  void getvdp(){
   this.vdp = x*norm[0] + y*norm[1] + z*norm[2]; 
  }
  
  private float[] project(){
    float px = x -norm[0]*vdp;
    float py = y - norm[1]*vdp;
    float pz = z - norm[2]*vdp;
    float[] projres = {px, py, pz};
    return projres;
  }
  
  void rotate(float px, float py, float pz){
    float ix = px*cos(-RA) - py*sin(-RA);
    this.updown = px*sin(-RA) + py*cos(-RA);
    this.leftright = ix*sin(-DEC) + pz*cos(-DEC);
  }
  
  public void update(float teRA, float teDEC){
    this.getRA(teRA);
    this.getDEC(teDEC);
    this.getNorm();
    float[] projres = this.project();
    this.rotate(projres[0], projres[1], projres[2]);
  }
}
