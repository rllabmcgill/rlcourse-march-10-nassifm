function [action] = A4_policy(~)
% A4_POLICY Selects an actions based on the current state.
%   Current implementation: random selection with 0.5 probability for each.
%   Takes 1 argument (the state), that is not used in this implementation.

if rand < 0.5
    action = -1;
else
    action = 1;
end

end