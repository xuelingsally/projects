function[] = nofeedbackgenerationplot2012a(lambda, TD, D, N,  G, n_samples, K)
G =2000;
n_samples =100;
N  = 100;
%L2 = 29;
lambda =100;
D =4;
TD =30;
g = 6;
for i = 1 : n_samples
  s(i) = i;  
  for r = s(i) : min(floor(1.5*n_samples), g*s(i))
  K(r) =r;
  x2(r, i) = nofeedbackgenerations(lambda, TD, D, N, 0.25, G, s(i), K(r))/(K(r)*floor(N/s(i)));
  y2(r, i) = nofeedbackgenerations(lambda, TD, D, N, 0.5, G, s(i), K(r))/(K(r)*floor(N/s(i)));
  j2(r, i) = nofeedbackgenerations(lambda, TD, D, N, 0.75, G, s(i), K(r))/(K(r)*floor(N/s(i)));
  end
 [x22(i), kx(i)] = max(x2(1 :size(x2) ,i));
 [y22(i), ky(i)] = max(y2(1 :size(y2) ,i));
 [j22(i), kj(i)] = max(j2(1 :size(j2) ,i))
end
%plot(s,x22,s,y22, s, j22);
plot(s, kx,s, ky, s, kj);
% %% second loop :
% s =  10;
% for  i = floor(s/2) : n_samples
%    K(i) = 2*i;
%   %t(i) = nofeedbackgenerations(lambda, TD, D, N, 0.25, G, s, K(i));
%    x(i) = nofeedbackgenerations(lambda, TD, D, N, 0.25, G, s, K(i))%/(K(i)*10)
%    y(i) = nofeedbackgenerations(lambda, TD, D, N, 0.5, G, s, K(i))%/(K(i)*10);
%    j(i) = nofeedbackgenerations(lambda, TD, D, N, 0.75, G, s, K(i))%/(K(i)*10);
%    x1(i) = nofeedbackgenerations(100, TD, D, N, 0.25, G, s, K(i))%/(K(i)*10);
%    y1(i) = nofeedbackgenerations(100, TD, D, N, 0.5, G, s, K(i))%/(K(i)*10);
%    j1(i) = nofeedbackgenerations(100, TD, D, N, 0.75, G, s, K(i))%/(K(i)*10)
% end
% plot(K,x,K,y, K, j, K, x1, K, y1, K, j1)
% % %plot(K, t);
end