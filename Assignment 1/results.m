[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 100, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);

[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 1000, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);

[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 10000, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);

[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 100000, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);

[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 1000000, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);

[ xMin, xMax, xMean, xStd ] = evaluateEstimator( 10000000, 100 );
fprintf('Min: %.5f  Max: %.5f  Mean: %.5f  Std: %.5f \n', xMin, xMax, xMean, xStd);
