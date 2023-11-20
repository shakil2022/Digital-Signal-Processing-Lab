A=1;F=2;theta=0;
t=0:0.01:1;
Y=A*sin(2*pi*F*t+theta);
plot(t,Y);
xlabel('Time (sec)');

ylabel('X_A');

title('Analogue (Continuous) Input Signal', 'Linewidth',5);

%discrete signal
Fs=2*F;Ts=1/Fs;
n=Fs;
n1=0:Ts:n*Ts;
Xs=A*sin(2*pi*F*n1+theta);
stem(n1,Xs);
xlabel('Sampling(n)');
ylabel('X_S');
title('Constructed Discrete Signal (Fs=1.5*F)', 'Linewidth',5);

%reconstructed signla
t1=linspace(0,max(n1),100);
Xr=interp1(n1,Xs,t1,'spline');
plot(t1,Xr);
xlabel('Time (sec)');

ylabel('X_A');

title('Reconstructed Signal when(Fs=2*F)');

