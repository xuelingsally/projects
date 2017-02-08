%new version project frossard
%image comm project
function [DisTot] = RandomSlottedAlohav3Distortion2classes(G,P1,P2, Z, Cw,RD1, RD2, L1)
%N : users number
%P : Degree Distribution %a0+ a1*x .... aN*xN
DisTot=0;
% Z = 2;
% G=0.5;
% P=[0 0 0 0 0 1]% 0 0 0.22];
% %P = [0 0 1];
% Cw =60;
% a=1; b=1; c=1;
sigma1=100;sigma2=500;
N = round(G*Cw);
PC= cumsum(P1);
PC2= cumsum(P2);
parfor d=1:Z
    X = [];
    Essays = zeros(1,N);
    for j=1:L1
        x = rand();
        z = PC-x;
        a = z;
        a(a<0)=[];
        if ~isempty(a)
        Essays(j)=find(z==a(1), 1 )-1;
        else
        Essays(j)=0;
        end
    end
    for j=L1+1:N
        x = rand();
        z = PC2-x;
        a = z;
        a(a<0)=[];
        if ~isempty(a)
        Essays(j)=find(z==a(1), 1 )-1;
        else
        Essays(j)=0;
        end
   end
    Timer1 = zeros(N, max(Essays))-100;
    for j=1:N
       if Essays(j)~=0
            for l=1:Essays(j)
                Timer1(j, l)=1+round(rand()*(Cw-1));
                if l~=1
                    a = numel(find(Timer1(j, :)==Timer1(j,l)));
                    while a>1
                           Timer1(j, l)=1+round(rand()*(Cw-1));
                           a = numel(find(Timer1(j, :)==Timer1(j,l)));
                    end
                end                 
            end
        end
    end
    A= unique(Timer1(:));%find the used slots
    A(A<0)=[];
    for j=1:length(A)   %try to see for each slot which packets have been transmitted
        [a, ~] = find(Timer1==A(j));
        X(a, j)=1;
    end
[~, Tab2]= rrefsergeTaharv2(X);
Thr1= sum(Tab2<=L1);
Thr2= sum(Tab2>L1);
% Dis1 = Distortion(RD1(1), RD1(2), RD1(3), Thr1);
% Dis2 = Distortion(RD2(1), RD2(2), RD2(3), Thr2);
%Dis = (L1*Dis1+(N-L1)*Dis2)/(N);
Dis1=Dis2(Thr1, sigma1);
Dis3=Dis2(Thr2, sigma2);
Dis = (Dis1+Dis3)/2
DisTot = DisTot+Dis/Z;
end