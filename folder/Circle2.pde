m=300;
size(500,500);           
background(255);

int[] createColor(){
    int redColor=random(0,255);
    int greenColor=random(0,255);
    int blueColor=random(0,255);
    int[] colors = {redColor,greenColor,blueColor};
    return colors;
}
double a=0;
double b=0;

fill(0);
ArrayList<int> data = new ArrayList<int>();

for(int i=0; i<100; i++){
 data.add((int)random(3,50))
};

string name[]={"Public services", "Safety", "Education",
"Health", "Social security", "Housing", "Culture",
"Energy", "Agriculture", "Mining", "Communications",
"Economic affairs", "Others"};

float[] freq= {408, 1752, 4364, 5618, 1437, 1275, 421,
74, 213, 73, 1219, 390, 766};

int summation(array){
int sum =0;
for(i=0;i<array.length();i++)
sum=sum+array[i];
return sum;
}

total=summation(freq);
for(j=0;j<name.length();j++){
a=b;
b=(freq[j]/total*2*PI)+b;
c=(b-a)/2+a;
        colors=createColor();
        fill(colors[0],colors[1],colors[2]);
arc(m/2,m/2,0.8*m,0.8*m,a,b);

        if(cos(c)<0 && sin(c)<0 )
          {  //text(name[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2);
            text(freq[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2);}
        
        else if (cos(c)>0 && sin(c)>0 )
           {// text(name[j],(m/2)+cos(c)*m/2,(m/2)+0.8*sin(c)*m/2+10);
            text(freq[j],(m/2)+cos(c)*m/2-20,(m/2)+0.8*sin(c)*m/2+10 );}
            
        else if(cos(c)<0 && sin(c)>0)
            {//text(name[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+sin(c)*(m/2));
             text(freq[j],(m/2)+0.8*cos(c)*m/2-20,(m/2)+sin(c)*(m/2));}
             
        else
           { //text(name[j],(m/2)+0.8*cos(c)*m/2,(m/2)+0.8*sin(c)*m/2);
             text(freq[j],(m/2)+0.8*cos(c)*m/2,(m/2)+0.8*sin(c)*m/2 );}
    rect(40,292+j*12,5,5)         
    text(name[j]+"="+freq[j],50,300+j*12)
}
///////
textSize(20);
fill(0);
text("sum="+total,250,350)