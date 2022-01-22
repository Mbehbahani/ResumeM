//var canvas = createCanvas(300, 300);
//canvas.parent('sketch-holder');

y=0;setup=_=>{var canvas=createCanvas(w=580,180);h=w/2;q=w/4; canvas.parent('sketch-holder');}



draw=_=>{  

  textSize(20);
  text("Engineer", 10, 150); 
  
  textSize(52);
  fill(0, 102, 153);
  text("Mohammad Behbahani", 10, 110); 
  
  
  if(y<w)for(x=w;x--;line(x,y,x,y+l))stroke(l=f((x-h)/q,(y-h)/q),l*2,l*4)
y++}
f=(x,y,n=4)=>n?f(cos(3*x)-sin(4*y),x*x-y*y-2*x*y,n-1):(x-y)**2*24
//reference: https://www.dwitter.net/h/julia

// y=0
// setup=_=>{
//   createCanvas(w=1024,w)
//   h=w/2
//   q=w/4
// }
// draw=_=>{
//   if(y<w){
//     for(x=w;x--;){
//       stroke(l=f((x-h)/q,(y-h)/q))
//       line(x,y,x,y+l)
//     }
//   }
//   y++
// }
// f=(x,y,n=4)=>
//   n?
//     f(cos(3*x)-sin(4*y),x*x-y*y-2*x*y,n-1)
//     :(x-y)**2*24