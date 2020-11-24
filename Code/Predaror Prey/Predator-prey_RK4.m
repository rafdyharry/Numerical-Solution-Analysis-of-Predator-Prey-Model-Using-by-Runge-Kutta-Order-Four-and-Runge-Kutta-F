clc;
clear all ;
close all;
format long g;
a1=3;
a2=0.002;
b1=0.0006;
b2=0.5;
h=0.1;
y=0:h:10;
n=length(y);
x(1)=1000;
w(1)=500;
for i=2:n
    k11=h*((a1*(x(i-1)))-(a2*(x(i-1))*(w(i-1))));
    k21=h*((b1*(x(i-1))*(w(i-1)))-(b2*(w(i-1))));
   
    k12=h*((a1*((x(i-1)+(0.5*(k11)))))-(a2*((x(i-1))+(0.5*(k11)))*((w(i-1))+(0.5*(k21)))));
    k22=h*((b1*((x(i-1))+(0.5*(k11)))*((w(i-1))+(0.5*(k21))))-(b2*((w(i-1)+(0.5*(k11))))));
    
    k13=h*((a1*((x(i-1)+(0.5*(k12)))))-(a2*((x(i-1))+(0.5*(k12)))*((w(i-1))+(0.5*(k22)))));
    k23=h*((b1*((x(i-1))+(0.5*(k12)))*((w(i-1))+(0.5*(k22))))-(b2*((w(i-1)+(0.5*(k12))))));
    
    k14=h*((a1*((x(i-1)+(k13))))-(a2*((x(i-1))+(k13))*((w(i-1))+(k23))));
    k24=h*((b1*((x(i-1))+(k13)))*((w(i-1))+(k23))-(b2*((w(i-1)+(k13)))));
   
   
  
    x(i)=(x(i-1))+((1/6)*(k11+(2*k12)+(2*k13)+k14));
    w(i)=(w(i-1))+((1/6)*(k21+(2*k22)+(2*k23)+k24));
    
end
%title('runge kuuta orde 4')
plot (x,w)
%xlabel('mangsa'),ylabel('pemangsa')
%plot(y,x,'b')
%hold on 
%plot(y,w,'r')
%hold off
%xlabel('Waktu'),ylabel('Jumlah Populasi')
%make_legend ('mangsa','pemangsa',-1)