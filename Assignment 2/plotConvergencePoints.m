
figure;
hold on;
markers = ['b', 'r', 'g'];
% Iterate over all the grid coordinates and plot result
for x = -2:.5:2
    for y = -2:.5:2
        index = pointOfConvergenceFromStartingPoint( [x,y] );
        if(index>0)
            scatter(x,y, markers(index), 'filled');
        end
    end
end

