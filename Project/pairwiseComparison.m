%% 1. Load results of algorithm A and B

% % Best Insertion vs. Shortest Edge
% A = load('Results/Best Insertion.mat');
% B = load('Results/Shortest Edge.mat');

% % Saving vs. Shortest Edge
% A = load('Results/Saving.mat');
% B = load('Results/Shortest Edge.mat');

% % Metropolis SA vs. Heatbath SA (mixed)
% A = load('Results/SA Metropolis (mixed).mat');
% B = load('Results/SA Heatbath (mixed).mat');

% % GLS swap vs. translation
% A = load('Results/GLS (swap).mat');
% B = load('Results/GLS (translation).mat');

% % GLS swap vs. inversion
% A = load('Results/GLS (swap).mat');
% B = load('Results/GLS (inversion).mat');

% % GLS swap vs. mixed
% A = load('Results/GLS (swap).mat');
% B = load('Results/GLS (mixed).mat');

% % GLS translation vs. inversion
% A = load('Results/GLS (translation).mat');
% B = load('Results/GLS (inversion).mat');

% % GLS translation vs. mixed
% A = load('Results/GLS (translation).mat');
% B = load('Results/GLS (mixed).mat');

% % GLS inversion vs. mixed
% A = load('Results/GLS (inversion).mat');
% B = load('Results/GLS (mixed).mat');

%% 2. Compute test-statistics

alpha = 0.9;
n = 40;

m_A = mean(A.loss);
m_B = mean(B.loss);

s_A = std(A.loss);
s_B = std(B.loss);

T = (m_A-m_B) / sqrt((s_A^2+s_B^2)/n); % Note: Symplified because n_A = n_B

% Compute degrees of freedom of T
dof = (n+1)*((s_A^2+s_B^2)/n)^2/((s_A^2/n)^2+(s_B^2/n)^2)-2; 

beta = tinv(alpha, dof);

disp(m_A)
disp(m_B)
disp(T)
disp(beta)

%% Evaluate
if T<-abs(beta)
    disp('A better than B');
elseif T>abs(beta)
    disp('B better than A');
else
    disp('More or less equaly good');
end
