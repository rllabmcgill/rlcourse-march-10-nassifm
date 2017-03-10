function [trajectory, reward] = A4_episode(start)
% A4_EPISODE Executes one episode
%   The last state is not included in the trajectory, as it can be
%   determined by the reward, and it is outside the range 1:WALK_SIZE.

    state = start;
    trajectory = zeros(1, 100);
    n = 0;
    t = 100;
    finished = false;
    while ~finished
        n = n + 1;
        if n > t
            t = t + 100;
            trajectory(t) = 0;
        end
        trajectory(n) = state;
        [state, reward, finished] = A4_model(state);
    end
    trajectory = trajectory(1:n);
end