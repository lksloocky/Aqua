












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
  
  
}
