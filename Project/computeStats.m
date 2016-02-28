clear all

% load('Results/Best Insertion.mat');
% load('Results/Shortest Edge.mat');
% load('Results/Saving.mat');

% load('Results/GLS (swap).mat');
% load('Results/GLS (translation).mat');
% load('Results/GLS (inversion).mat');
% load('Results/GLS (mixed).mat');

% load('Results/SA Metropolis (swap).mat');
% load('Results/SA Metropolis (translation).mat');
% load('Results/SA Metropolis (inversion).mat');
% load('Results/SA Metropolis (mixed).mat');

% load('Results/SA Heatbath (swap).mat');
% load('Results/SA Heatbath (translation).mat');
% load('Results/SA Heatbath (inversion).mat');
% load('Results/SA Heatbath (mixed).mat');

m = 40;

% Min, max and mean of losses
[minL, pathIdx] = min(loss);
maxL = max(loss);
meanL = mean(loss);

% Compute confidence interval for mean at level alpha
alpha = 0.95;
a1 = tinv((1-alpha)/2,m-1);
a2 = tinv((1+alpha)/2,m-1);
s = std(loss);
S1 = meanL-a2*s/sqrt(m);
S2 = meanL-a1*s/sqrt(m);
meanConfidenceInterval = [S1,S2];

disp(minL)
disp(maxL)
disp(meanL)
disp(meanConfidenceInterval)
