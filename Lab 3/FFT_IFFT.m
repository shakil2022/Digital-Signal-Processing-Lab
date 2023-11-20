x=input('Enter the sequence x(n)')
N=length(x);
xk=fft(x,N);
ixk=ifft(xk);
%plot input sequence
t=0:N-1
subplot(221)
stem(t,x);
title('Input sequenc');
xlabel('amplitude');
ylabel('n===>');

%plot magnitude
subplot(222)
stem(t,abs(xk));
title('Magnitude');
xlabel('n--->');
ylabel('Magnitude');


%phase plot
subplot(223)
stem(t,angle(xk));
title('phase sequence')
xlabel('n-->');
ylabel('Phase');


%IFFT
subplot(224)
stem(t,ixk);
title('IFFt');
xlabel('n--->');
ylabel('amplitude');

disp(xk)
disp(ixk)
