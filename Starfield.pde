Particle[] ann;
void setup()
{
	size(500,500);
  ann = new Particle[2000];
  for(int i = 0; i < ann.length; i++)
  {
    ann[i] = new NormalParticle();
  }
  ann[1000] = new OddballParticle();
  ann[999] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i < ann.length; i++)
  {
    ann[i].move();
    ann[i].show();
  }
}
class NormalParticle implements Particle
{
	public double myX, myY, myAngle, mySpeed;
  //public int cX, cY;
  NormalParticle()
  {
    myX = myY = 250;
    myAngle = (Math.random()*3) * Math.PI;
    mySpeed = (Math.random()*4);
  }
  void move()
  {
    myX = myX + (Math.cos(myAngle) * mySpeed);
    myY = myY + (Math.sin(myAngle) * mySpeed);
    //while(myX > 400 || myY > 400)
    {
      //cY = cY + 1;
      //cX = cX + 1;
    } 
  }
  void show()
  {
    noStroke();
    fill((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
    ellipse((int)myX, (int)myY, 5, 5);
  }
}
interface Particle
{
	public void show();
  public void move();
}
class OddballParticle implements Particle
{
  public int obX, obY;
  OddballParticle()
  {  
    obX = obY = 250;
  }
  void move()
  {
    obX = obX + (int)(Math.random()*6)-3;
    obY = obY + (int)(Math.random()*6)-3;
  }
  void show()
  {
    noStroke();
    fill(50, 200, 250);
    ellipse((int)obX, (int)obY, 50, 50);
    fill(255);
    ellipse((int)obX, (int)obY + 10, 70, 30);
  }
}
class JumboParticle extends NormalParticle
{
  public int jSpeed, jA;
  JumboParticle()
  {
    jSpeed = 1;
    jA = 100;
  }
  void move()
  {
    myX = myX + (Math.cos(myAngle) * jSpeed);
    myY = myY + (Math.sin(myAngle) * jSpeed);
    jA = jA + 1;
  }
  void show()
  {
    noStroke();
    fill(100);
    ellipse((int)myX, (int)myY, jA,jA);
  }
}
