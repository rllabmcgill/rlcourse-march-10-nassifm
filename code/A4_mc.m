function [theta] = A4_mc(alpha, nb_episodes, theta)
% A4_MONTE_CARLO Uses Monte-Carlo algorithm to obtain the value of theta.
%   If called with only 2 arguments, the initial theta vector will be
%   initialized with zeros.

global WALK_SIZE GROUPS;

if nargin < 3
    theta = zeros(1, max(GROUPS));
end
start = floor(WALK_SIZE / 2);
for i=1:nb_episodes
    if mod(i, 500) == 0
        disp(i)
    end
    [trajectory, reward] = A4_episode(start);
    for s=trajectory
        g = GROUPS(s);
        theta(g) = theta(g) + alpha * (reward - theta(g));
    end
end

end