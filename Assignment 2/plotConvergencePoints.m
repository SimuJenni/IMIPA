h = waitbar(0,'please wait...');
f = figure('Visible','off');
hold on;
markers = ['b', 'r', 'g'];

% Iterate over all the grid coordinates and plot result
for x = -2:.05:2
    for y = -2:.05:2
        index = pointOfConvergenceFromStartingPoint( [x,y] );
        if(index>0)
            scatter(x,y, markers(index), 'filled');
        end
    end
    waitbar((x+2)/4);
end
set(f,'Visible','on');
close(h);
hold off;
