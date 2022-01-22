
%% this is the main inventory control model
% [total]=invmodel(x)
% is an (s,S) Simulation function where the input argument is
%x=[s,S]
% visit my website for more information
% https://mbehbahani.github.io/MyWeb/folder/Thesis.html
% Email: Behbahanimd@gmail.com
%
% This functions is based on the (s, S) inventory model
%Biles et al. (2007) (Biles,W. E.,Kleijnen, J. P., van Beers,W.,VanNieuwenhuyse, I. (2007,December)
%Kriging metamodeling in constrained simulation optimization: An explorative study. Paper presented at the Proceedings of
%the 39th conference onWinter simulation, Piscataway, NJ, USA.)

% You should enter s and S values.
% Also you will have to determine the following constants according to the problem

% duration stands for time period
% y1 stands for inventory at hand
% y1 stands for inventory position
%(the quantity of inventory at hand plus outstanding orders minus backorders)
% Q stans for the quantity of replenishment order
% LT stands for Lead Time
% RT stands for time of receipt
% H holding cost per unit
% SH shortage cost per unit
% O oreder cost per unit
% A order cost for each time
% D stands for Demand
% sk:small s
% SB:Big S


%  Copyright (c) 2019, M. Behbahani
%  All rights reserved.
%
%
%  Redistribution and use in source and binary forms, with or without
%  modification, are permitted provided that the following conditions are
%  met:
%
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
%
%  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
%  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
%  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
%  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
%  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
%  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
%  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
%  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
%  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
%  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%  POSSIBILITY OF SUCH DAMAGE.



function [totalcost]=invmodel(x)
sk=x(1);
SB=x(2);
duration=4000;
A=32;
O=3;
H=1;
SH=5;
LT=makedist('Poisson',6);
% random(LT)
D=makedist('Poisson',90);
%random(D)

y1=zeros(1,duration);
y2=zeros(1,duration);
ouor=zeros(1,duration);
Q=zeros(1,duration);
cost.h=zeros(1,duration);
cost.sh=zeros(1,duration);
cost.o=zeros(1,duration);
RT.a=[];
RT(1).a=inf;
z=1;
demand=zeros(1,duration);
shortage=zeros(1,duration);
y1(1)=SB;
y2(1)=SB;
ouor(1)=0;
j=1;

for i=1:duration
    
    %     demand(i)=random(D);
    dem=0;
    for c=1:random(D)
        % for deman dper customer
        rndnum=rand;
        if rndnum<0.33
            DperC=0.5;
        elseif rndnum<0.66
            DperC=1;
        else
            DperC=1.5;
        end
        dem=dem+DperC;
    end
    demand(i)=dem;
    
    if y1(i)-demand(i)<0
        shortage(i)=y1(i)-demand(i);
        cost.sh(i)=-shortage(i)*SH;
    else
        cost.h(i)=(y1(i)-demand(i))*H;
    end
    
    y2(i+1)=y2(i)-demand(i);
    
    if y2(i+1)<=sk
        Q(i)=SB-y2(i+1);
        cost.o(i)=A+O*Q(i);
        y2(i+1)=y2(i+1)+Q(i);
        %when will be received?(Receive Time)
        RT(j).a=[(i+random(LT))-1,Q(i)];
        j=j+1;
        RT(j).a=inf;
    end
    
    if i>=RT(z).a(1)
        ouor(i)=RT(z).a(2);
        z=z+1;
    else
        ouor(i)=0;
    end
    
    y1(i+1)=y1(i)-demand(i)+ouor(i);
    
end

totalcost=(sum(cost.h)+sum(cost.o)+sum(cost.sh))/duration;
end