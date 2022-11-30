function  probSix= deMere1(numReps)

% numReps = 1000;
numRolls= 4; 
numSixes = 0;
for run = 1: numReps
    roll = randi(6,numRolls,1); % the random expt
    if any(roll==6)
        numSixes = numSixes + 1; % the quantity of interest
    end
end
 probSix = numSixes/numReps; % the frequency of a 6
% fprintf('Prob of a 6 is %6.4f\n',probSix)
end
