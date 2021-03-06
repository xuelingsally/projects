 function [nb_packets_not_expired_block] = nofeedbacksliding(lambda, TD, D, N, P, G, size_window, K, s)
%           lambda = 100;         
%           G = 100;
%           N  = 100;
%           size_window = 10;
%            D  = floor(size_window/lambda) +3;
%           s=5;
%           K  =5;
%           TD =30;
%           P =0.25;
nb_packets_not_expired_block = 0;
DecodingTime = 0;
for h = 1 : G
nb_packs = 0;
DecTime  = 0;
T=[];
i = 0;
while(length(T)<N)
    R = poissrnd(lambda);
    j=0;
    while (and(j<R,length(T)<N))
        T =[T,i+TD]; 
        j=j+1;
    end
i = i+1;
end
T = T-D;
if size_window>length(T)
    size_window = length(T);
end
SP = size_window;
SR =0;
H = 0;
while SP<=N
    i=0;  
    if SR>SP
          disp('__________________________________________________________________________________')
    end
      g = SR;
      while and(and(i<K, SR<SP),SR<g+size_window) 
      i = i+1;
      z = rand(1);
      if z>P
          SR = SR+1;
      end
      end
       T(H+1:SP) = T(H+1:SP)-i;
       T(SP+1:length(T)) = T(SP+1:length(T))-K;
       if (SR==SP)
       nb_packs = nb_packs + sum(T(H+1:SP)>=0);
       H = SP;
        end
       SP = SP+s;
end
i=0;
SP = mod(length(T)-size_window, s);
while and(i<floor(K*mod(N, s)/s),i<mod(N, s))
    z = rand(1);
    if z>P
        SR = SR+1;
    end
    i = i+1;
end
if (SP==SR)
    for x = length(T) +1-mod(length(T),s) : length(T)
            T(x) = T(x)-i;
    end
    nb_packs = nb_packs + sum(T(s*floor(N/s)+1:length(T))>=0)
end
nb_packets_not_expired_block = nb_packets_not_expired_block+nb_packs;
end
nb_packets_not_expired_block = nb_packets_not_expired_block/G;
end