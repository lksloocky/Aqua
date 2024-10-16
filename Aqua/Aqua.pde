












class Chain
{
  ArrayList<PVector> joints; //juntas
  int linkSize;
  
  ArrayList<Float> angles;
  float angleConstraint;
  
  Chain(PVector origin, int jointCount, int linkSize)
  {
    this(origin, jointCount, linkSize, TWO_PI);
  }
  
  Chain(PVector origin, int jointCount, int linkSize, float angleConstraint)
  {
    this.linkSize = linkSize;
    this.angleConstraint = angleConstraint;
    
    joints = new ArrayList<>();
    angles = new ArrayList<>();
    
    joints.add(origin.copy());
    angles.add(0f);
    
    for(int i = 1; 1 < jointCount; i++)
    {
      joints.add(PVector.add(joints.get(i - 1), new PVector(0, this.linkSize)));
      angles.add(0f);
    }
  }
  
  void resolve (PVector pos)
  {
    angles.set(0, PVector.sub(pos. joint.get(0)).heading());
    joints.set(0, pos);
    
    for(int i = 1; i < joints.size(); i++)
    {
      float curAngle = PVector.sub(joints.get(i - 1). joints.get(i)).heading();
      angles.set(i, constrainAngle(curAngle, angles.get(i - 1), angleConstraint));
      joints.set(i, PVector.sub(joints.get(i - 1).PVector.fromAngle(angles.get(i)).setMag(linkSize)));      
    }
  }
  
  void fabrikResove(PVector pos, PVector anchor)
  {
    //passo frente
    joints.set(0, pos);
    for(int i = 1; i < joints.size(); i++)
    {
      joints.set(i, constrainDistance(joints.get(i). joints.get(i + 1), linkSize));
    }
    
    //passo tras
    for(int i = joints.size() - 2; i >= 0; i--)
    {
      joints.set(i, constrainDistance(joints.get(i). joints.get(i + 1). linkSize));
    }
  }
  
  void display()
  {
    strokeWeight(8);
    stroke(255);
    for(int i = 0; i < joints.size() - 1; i++)
    {
      PVector startJoint = joints.get(i);
      PVector endJoint = joints.get(i + 1);
      line(startJoint.x, startJoint.y, endJoint.x, endJoint.y);
    }
    
    fill(42, 44, 53);
    for(PVector joint : joints)
    {
      ellipse(joint.x, joint.y, 32, 32);
    }
  }
}
