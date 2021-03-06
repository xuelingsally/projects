R= 0:20;
sigma1=(100);sigma2=(500);sigma3=(1000);
RD1f = sigma1*(2.^(-R));
RD2f = sigma2*(2.^(-R));
RD3f = sigma3*(2.^(-R));
figure(1);
plot(R, RD1f,'-',R, RD2f,'-',R, RD3f,'-'); 
legend('RD1', 'RD2','RD3');
xlabel('rate');
ylabel('distortion');
R(1)=[];
figure(2);
plot(R, abs(diff(RD1f)),R, abs(diff(RD2f)),'-',R, abs(diff(RD3f))); 
legend('absdiffRD1', 'absdiffRD2','absdiffRD3');
xlabel('rate');
ylabel('abs diff distortion');
