function [ l, sigma ] = SA( D, moveFun, tpf, plot, algName )
%SA Simulated annealing with transition-probability tpf to solve the
%TSP defined by the NxN distance matrix D and returns the the value of
%the Loss at the found solution (L) and the corresponding path (sigma).

N = size(D,1);
numMovesPerTemp = 1000;

%% Initialisation
sigma = randperm(N);    % Initial solution
losses = cell(0);       % Cell array caching l-values per temperature
temps = [];             % Cache temperatures
% Init Temparature
randWalklenght = numMovesPerTemp*2;
[T, sigma] = initialTemperature( sigma, D, moveFun, randWalklenght);
l = L(D,sigma);

%% Iterations
converged = false;
dls = []; % stores the values of l for each temperature level
itr = 0;
while(~converged)
    losses{end+1} = zeros(1,numMovesPerTemp);
    temps(end+1) = T;
    for i=1:numMovesPerTemp
        % Generate new path relative to current solution
        [newSigma, dl] = moveFun(sigma, D);
        % Cache the loss-value
        losses{end}(i) = l+dl;
        % Compute acceptance probability
        p = tpf(dl, T);
        x = rand;
        if x<p
            % Accept move
            sigma = newSigma;
            l = l+dl;
        end
    end
    % Check stopping criterion
    if itr>75 && abs(std(dls(end-75:end)))<0.0001
        converged = true;
    end
    % Cooling
    T = 0.95*T;
    itr = itr+1;
    dls(itr) = l;
end

% Sanity check
assert(abs(l-L(D,sigma))<0.01);

%% Performance plots 
if plot
    loss = cell2mat(losses')';
    figure;
    semilogx(temps,min(loss),'r');
    hold on;
    semilogx(temps,max(loss),'g');
    semilogx(temps,mean(loss),'b');
    set ( gca, 'xdir', 'reverse' )
    grid on;
    title(['Performance plot ' algName ]);
    xlabel('Temperature') % x-axis label
    ylabel('Loss') % y-axis label
    legend('min','max','mean');
    hold off;
    savefig(['Figures/' algName '_performance']);
end

end

function [T, sigma] = initialTemperature( sigma, D, moveFun, randWalklenght)
%Initialises T according to ad-hoc procedure.

dL = zeros(1, randWalklenght);

% Perform randowm walk and record dL
for i=1:randWalklenght
    [newSigma, dl] = moveFun(sigma, D);
    if dl<0
        sigma = newSigma;
        dL(i) = abs(dl);
    end
end

T = -max(dL)/log(0.9);

end
