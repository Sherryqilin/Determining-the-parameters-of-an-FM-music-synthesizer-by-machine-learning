close all
clear all
clc

% define sample rate
fs = 44100;


A = 0.75;  
t = 1;   

% https://www.phys.unsw.edu.au/jw/notes.html
midiNotes = 21:108;
Cvals = zeros(size(midiNotes));
for i = 1:length(midiNotes)
    Cvals(i) = midi2freq(midiNotes(i));
end

Mvals = 0.5:0.5:31;
Dvals = 0:99;

for i = 1:length(Cvals)
    for j = 1:length(Mvals)
        for k = 1:length(Dvals)
             [y] = sineFM(A,t,Cvals(i),Dvals(k),Mvals(j),fs);
             audiowrite(sprintf('FM_C_%i_M_%i_D_%i.wav',Cvals(i),Mvals(j),Dvals(k)),y,fs)
        end
    end
end