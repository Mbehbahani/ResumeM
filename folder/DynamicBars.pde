m=350;
size(700,460);
int c=(m-20)/50;
b=(m-50)/140;
rect(20,0,m-20,m-20);
fill(0);
line(20,m-20,m-20,m-20);
triangle(m-20,m-30,m-20,m-10,m,m-20);
line(20,m-20,20,20);
triangle(10,20,30,20,20,0);
float[] rainday = {0,0,0,0,0,0,0,0,0,0,0,0.2,0,0,0,0,0,0,0,0.4,0.2,8,7.6,0,0,0,0,0,17.8,18.6,0,0,13.2,4.8,0
,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.4,0,0,0,0,0,0,0,0,0,0.2,21.6,0,0,20,2.4,0,0,0,0,0,0,8,0.4,0,0,0,0,0,
1.2,0,0,0,0,0,0,0,0,0,0,0,4.6,0.2,0,0,0,0.4,0,0,0,0,0,0,0,0,0,0.2,0.2,0,0,0,0,0,0,4,0,1.6,0,0.8,5.2,0,0,0,0.4,0.8,
16,0.6,4.6,0.4,0,0,0.6,0.2,0,0,0.2,0,0,7.2,0.4,3.4,24.2,2.8,17,0,1.2,0.4,0.2,0.2,18.4,0,0.2,11.4,1.6,3.8,5.2,2.4,
1.8,0,0,0,0,2.4,4,0,0,0.6,3.8,11.8,2.6,20,0.6,0,2.6,0,0,1.6,2.6,1.4,0,0.2,37.6,2.4,1.6,0,0,6.6,1.4,6,7,0.6,0.2,0,0,0,
0,5,0,0.6,4.2,0,11.4,8.8,10.4,0.2,0,0,3.8,11,1.8,0,0.4,0,0,0,0,0.6,3.6,8.2,0,0,0,0,0,0.8,0,16.8,7,0.2,0,0,0,0,0,0,0,1.6,
5.8,1,0.2,0.2,0.4,1,0,0,0,1.2,30.4,0.2,0,0,6.2,15.6,16.6,0,0,2.4,0.4,0.4,1.6,0,0,2.4,2,0,0,0,37.8,12.2,4.2,0,27.6,11.8,0,0,0,
0,0,2,0.4,0.8,0.6,0,0,1.2,14.2,4.2,3.8,0,9.4,0.2,0,0,0,0,0,0,0,0,0.6,0,0,0,0,0,0,0,0,0,0,0,14,16.4,1.8,0,0,0,0,0,0,0,0.8,0.2,0,
0,0,0,0,0,0,0,0,0,0,4.6,0,0,8,0.8,0,0,0,0,0.4,0,0,0.4,0,0,2.2,0,0,0,0,0,0.2,5.8,61.2,3,0.2,0};

Float nonzero(array){
    ArrayList <Float> data = new ArrayList<Float>();
for(i=0;i<array.length();i++)
if(array[i]!=0)
data.add(array[i]);
return data;
}

float mean(array){
   sum=0;
for(i=0;i<array.size();i++)
sum+=array.get(i);
return (sum/array.size());
}

float sort(array){
ArrayList <Float> sd = new ArrayList<Float>();
for(i=0;i<array.size();i++){
for(j=i;j<array.size();j++){
if(array.get(j)<array.get(i)){
a=array.get(i);
array.set(i,array.get(j))
array.set(j,a)}}
 sd.add(array.get(i))
}
return sd;
};

//median
float median(array){
    ArrayList <Float> data = new ArrayList<Float>();
    if ((array.size()/2)%2!=0){
    data.add(array.get((array.size()+1)/2));
    data.add(array.get((array.size()-1)/2));
    }
    else   data.add(array.get((array.size())/2));
return data;
}

//" standard deviation"
float std(array){
    float summation = 0.0;
    s=mean(array);
    for(i=0;i<array.size();i++){
        summation+=sq(array.get(i)-s);
    }
    return sqrt(summation/array.size());
}


days=nonzero(rainday);


//show data
 for(i=0;i<days.size();i++){
        fill(days.get(i)*15,50,50)
        rect(20+i*b,m-20-days.get(i)*c,b,days.get(i)*c)
    }
avg=mean(days);
standardd=std(days);
sorted=sort(days);
med=median(sorted);

//show sorted data
fill(255);
rect(m+20,0,m-20,m-20);
fill(0);
line(m+20,m-20,2*m-20,m-20);
triangle(2*m-20,m-30,2*m-20,m-10,2*m,m-20);
triangle(m+10,20,m+30,20,m+20,0);

//show sorted data
 for(i=0;i<sorted.size();i++){
        fill(sorted.get(i)*15,50,50)
        rect(m+20+i*b,m-20-sorted.get(i)*c,b,sorted.get(i)*c)
    }



//mean line
textSize(20)
fill(255,0,0)
 strokeWeight(5)
    stroke(255,0,0)
    line(20,m-20-avg*c,m,m-20-avg*c)
    text("mean="+avg,m-100,m-30-avg*c)
    text("sorted data",2*m-250,m-250)
    text("median= "+med.get(0)+" & "+med.get(1),2*m-270,m-230)
    text("Standard deviation ="+standardd, 50,400);
    
    
    //for mode
    
    float Mode(mode){
    ArrayList <float> numbers = new ArrayList<float>();
    ArrayList <integers> occurences = new ArrayList<float>();
    for(int m = 0;m<mode.size();m++){
        if(!numbers.contains(mode.get(m))){
                numbers.add(mode.get(m))
                occurences.add(1);
        }
        else{
            for(int n = 0;n<numbers.size();n++){
                if(numbers.get(n) == mode.get(m)){
                    occurences.set(n,occurences.get(n)+1);
                };
            };
        };
    };
    int max = 0;
    float modus = 0;
    for(int b = 0;b<occurences.size();b++){
        if(occurences.get(b)>max){
            modus = numbers.get(b);
            max = occurences.get(b);
        };
    };
    return modus;
};

int r=Mode(days);
text("mode="+r, 50,450);