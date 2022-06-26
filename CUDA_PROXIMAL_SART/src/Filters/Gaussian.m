function weight = Gaussian(r, sigma)
    weight = exp(-1*(r*r)/(2*sigma*sigma))/(sqrt(2*pi)*sigma);
end

%To generate kernel:
% clear
% sigma = 0.4;
% x = 0:0.0001:2;
% y = x;
% for i = 1:length(y)
%     y(i) = Gaussian(x(i), sigma);
% end;
% plot(x,y);
% xlabel('distance (voxels)');
% ylabel('Weigth');
% title("Gaussian");
% y = transpose(y);



% To analyze frequency domain
% clear
% close all
% sigma = 0.4;
% period = 0.0001; %Period of sampling, in voxels
% x = -2:period:2;
% fs = 1/period;
% for i = 1:length(x)
%     y(i) = Gaussian(x(i), sigma) / Gaussian(0, sigma);
% end;
% plot(x,y);
% xlabel('distance (voxels)');
% ylabel('Weigth');
% title("Spatial Gaussian filter kernel");
% legend("Sigma: " + sigma)
% n = 10*2^nextpow2(length(x)); %To use the fft function to convert the signal to the frequency domain, first identify a new input length that is the next power of 2 from the original signal length. This will pad the signal X with trailing zeros in order to improve the performance of fft.
% Y = fft(y,n);
% f = fs*(0:(n/2))/n;
% P = abs(Y/n).^2;
% figure
% plot(f(1:130),mag2db(P(1:130)/P(1))) % plot(f,P(1:n/2+1)) 
% title('Gaussian kernel in frequency domain')
% legend("Sigma: " + sigma)
% xlabel('Frequency (f)')
% ylabel('Relative power (dB)')