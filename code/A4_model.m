function [state, reward, terminate] = A4_model(init_state, action)
% A4_MODEL Model of the MDP used for this assignment.
%   Random walk over WALK_SIZE integers.
%   Actions are left (-) or right (+), resulting in a movement of 1 to
%   JUMP_SIZE in either direction, according to the A4_jump() distribution.
%   Reward is -1 for ending at the left side, +1 for ending at the right
%   size, and 0 for all other jumps.
%   If only one argument is given, the action is selected according to the
%   policy.

global WALK_SIZE JUMP_SIZE

if nargin == 1
    action = A4_policy(init_state);
end

state = init_state + action * ceil(rand * JUMP_SIZE);
reward = 0;
terminate = false;
if state > WALK_SIZE
    state = WALK_SIZE + 1;
    reward = 1;
    terminate = true;
elseif state < 1
    state = 0;
    reward = -1;
    terminate = true;
end

end