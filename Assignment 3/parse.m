function [ n, c ] = parse( s )
%Parses the string s corresponding to linear constraint and returns number  
% of decision variables (n) and the vector coefficients (c).

% Convert to lower-case string
s = lower(s);

% Remove all spaces
s = regexprep(s,'[\s]+','');

% Find position of coefficients, variables and indices using regular 
% expressions
coeffPos = regexp(s, '([-]?[1-9]*(\s)?)x');
varPos = regexp(s, 'x');
indPos = varPos+1;
index = s(indPos);

% Get highest index
n = str2num(index(end));
c = zeros(n+1,1);

% Retrieve coefficients
for i=1:length(index)
    idx = str2num(index(i));
    if(coeffPos(i)==varPos(i))
        c(idx) = 1; % Case of zero
    else
        c(idx) = str2num(s(coeffPos(i):varPos(i)-1));
    end
end

% Get right hand side of inequality
i = regexp(s, '[<>=]');
c(n+1) = str2num(s(i+1:end));

end

