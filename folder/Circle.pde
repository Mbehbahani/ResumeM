void setup() 
{
  // general setup
  size (400,400);
  smooth();
}

void draw() 
{
m=400;
background(255);
double sum=0;
double a=0;
double b=0;
fill(0);
string name[]={"ITALY","CANADA","USA","RUSSA","POLAND","FRANCE","SPAIN"};
double humid[]={300,500,300,100,200,500,800};

for(i=0;i<name.length();i++)
sum=sum+humid[i];
for(j=0;j<name.length();j++){
a=b;
b=(humid[j]/sum*2*PI)+b;
c=(b-a)/2+a;
fill(a*b*10,255-a*15,255/c*2)
arc(m/2,m/2,0.8*m,0.8*m,a,b);
fill(0);
        if(cos(c)<0 && sin(c)<0 )
          {  text(name[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2-20);
            text(humid[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2-33);}
        else if (cos(c)>0 && sin(c)>0 )
           { text(name[j],(m/2)+cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2);
            text(humid[j],(m/2)+cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2-13);}
            
        else if(cos(c)<0 && sin(c)>0)
            {text(name[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+sin(c)*(m/2)-5);
             text(humid[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+sin(c)*(m/2)-18);}
             
        else
           { text(name[j],(m/2)+0.8*cos(c)*m/2,(m/2)+0.8*sin(c)*m/2);
             text(humid[j],(m/2)+0.8*cos(c)*m/2,(m/2)+0.8*sin(c)*m/2-13);}
}

}
