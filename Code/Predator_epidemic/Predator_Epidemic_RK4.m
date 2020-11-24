clc;
clear all ;
close all;
format long;
a=0.5;
K=20;
T=0.8;
r=0.7;
lamda=0.7;
m=0.65;
h=0.1;
y=0:h:10;
n=length(y);
P(1)=1;
I(1)=0.01
for i=2:n
    k11=h*((P(i-1))*(1-(((P(i-1))^2)/((a^2)*K*(T^2))))-((1)/(2*r))*(P(i-1))*(I(i-1)));
    k21=h*((2*(I(i-1)))*((((lamda)/(2*(a^2)*r*(T^2))))*((P(i-1))^2)-m));
   
    k12=h*(((P(i-1))+(0.5*(k11)))*(1-((((P(i-1))+(0.5*(k11)))^2)/((a^2)*K*(T^2))))-((1)/(2*r))*((P(i-1))+(0.5*(k11)))*((I(i-1))+(0.5*(k21))));
    k22=h*((2*((I(i-1))+(0.5*(k21))))*((((lamda)/(2*(a^2)*r*(T^2))))*(((P(i-1))+(0.5*(k11)))^2)-m));
    
    k13=h*(((P(i-1)+(0.5*(k12))))*(1-((((P(i-1)+(0.5*(k12))))^2)/((a^2)*K*(T^2))))-((1)/(2*r))*((P(i-1)+(0.5*(k12))))*((I(i-1))+(0.5*(k22))));
    k23=h*((2*((I(i-1))+(0.5*(k22))))*((((lamda)/(2*(a^2)*r*(T^2))))*(((P(i-1)+(0.5*(k12))))^2)-m));
    
    k14=h*(((P(i-1)+(k13)))*(1-((((P(i-1)+(k13)))^2)/((a^2)*K*(T^2))))-((1)/(2*r))*((P(i-1)+(k13)))*((I(i-1))+(k23)));
    k24=h*((2*((I(i-1)+(k23))))*((((lamda)/(2*(a^2)*r*(T^2))))*(((P(i-1)+(k13)))^2)-m));
    
      
   
  
    P(i)=(P(i-1))+((1/6)*(k11+(2*k12)+(2*k13)+k14));
    I(i)=(I(i-1))+((1/6)*(k21+(2*k22)+(2*k23)+k24));
    
end
%P,I
%plot (P,I)
xlabel('mangsa'),ylabel('pemangsa')
plot(y,P,'b')
hold on 
plot(y,I,'r')
hold off