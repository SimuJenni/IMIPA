clear all;
addpath(genpath('./'));

% Read the problem data
filePath = 'TSP_411.txt';

fileID = fopen(filePath,'r');
coord = fscanf(fileID,'%f', [3,Inf]);
fclose(fileID);

% Matrix of coordinates
X = coord(2:3,:);

% Compute distance matrix
D = distanceMatrix(X);

% Number of algorithm runs
m = 40;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithm to be tested
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Construction heuristics
% alg = @(x) bestInsertion(x);    algName = 'Best Insertion';
% alg = @(x) shortestEdge(x);     algName = 'Shortest Edge';
% alg = @(x) saving(x);            algName = 'Saving';

%% Improvement heuristics
% The move function used
% moveFun = @swap;            move =  'swap';          
% moveFun = @translation;     move =  'translation'; 
% moveFun = @inversion;       move =  'inversion'; 
moveFun = @mixedMove;       move =  'mixed'; 

%% Greedy Local Search
% alg = @(x) GLS(x, moveFun);
% algName = ['GLS (' move ')'];

%% Simulated Annealing
% Metropolis SA
algName = ['SA Metropolis (' move ')'];
alg = @(x) SA(x,moveFun, @metropolis, false, algName); 

% % Heatbath SA
% algName = ['SA Heatbath (' move ')'];
% alg = @(x) SA(x,moveFun, @heatBath, false, algName); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Evaluation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Arrays holding the results for the m runs
loss = zeros(1,m);
sigma = cell(1,m);
bests = cell(1,m);

% Run algorithm m-times and cache results
for i=1:m
    disp([algName ': run ' num2str(i) '/' num2str(m)]);
    [l,s] = alg(D);
    if length(l)>1
        loss(i) = l(end);
        bests{i} = l;
    else
        loss(i) = l;
    end
    sigma{i} = s; 
end

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

% Plot the solution path
plot(X(1,sigma{pathIdx}),X(2,sigma{pathIdx}));
title(['Solution path: ' algName]);


% % Save the results for later comparisons
% savefig(['Figures/' algName]);
% save(['Results/' algName], 'loss', 'sigma');

%% Performance plots for GLS
% best = cell2mat(bests');
% figure;
% hold on;
% grid on;
% plot(1:size(best,2),min(best),'r');
% plot(1:size(best,2),max(best),'g');
% plot(1:size(best,2),mean(best),'b');
% title(['Performance plot ' algName]);
% xlabel('Number of moves') % x-axis label
% ylabel('Loss') % y-axis label
% legend('min','max','mean');
% hold off;
% savefig(['Figures/' algName '_performance']);