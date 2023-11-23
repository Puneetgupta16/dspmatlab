lc
clear all;

t = (0:1000)';
fsignal = 0.01;
x = sin(2*pi*fsignal*t);
c = physconst('LightSpeed');
fc = 300e6;
incidentAngle = [45;0];
array = phased.ULA('NumElements',5);
x = collectPlaneWave(array,x,incidentAngle,fc,c);
noise = 0.1*(randn(size(x)) + 1j*randn(size(x)));
rx = x + noise;

beamformer = phased.PhaseShiftBeamformer('SensorArray',array,...
    'OperatingFrequency',fc,'PropagationSpeed',c,...
    'DirectionSource','Input port','WeightsOutputPort',true);

[y,w] = beamformer(rx,incidentAngle);
figure
plot(t,real(rx(:,3)),'r:',t,real(y))
xlabel('Time')
ylabel('Amplitude')
legend('Original','Beamformed')

figure
pattern(array,fc,[-180:180],0,'PropagationSpeed',c,'CoordinateSystem','rectangular','Weights',w)
