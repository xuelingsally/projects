R= 0:10;
RD1= [70 50 8];
RD2= [50 30 8];
RD3= [80 30 10]; 
RD1f = RD1(1)+RD1(2)./(R+RD1(3));
RD2f = RD2(1)+RD2(2)./(R+RD2(3));
RD3f = RD3(1)+RD3(2)./(R+RD3(3));
figure(1);
plot(R, RD1f,'*',R, RD2f,'-',R, RD3f,'.'); 
legend('RD1', 'RD2','RD3');
xlabel('rate');
ylabel('distortion');
R(1)=[];
figure(2);
plot(R, abs(diff(RD1f)),R, abs(diff(RD2f)),'-',R, abs(diff(RD3f))); 
legend('absdiffRD1', 'absdiffRD2','absdiffRD3');
xlabel('rate');
ylabel('abs diff distortion');
