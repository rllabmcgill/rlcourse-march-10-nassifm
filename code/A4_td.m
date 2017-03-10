function [theta] = A4_td(alpha, nb_episodes, theta)
% A4_TD Uses temporal-difference algorithm to obtain the value of theta.
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
    for j=1:(length(trajectory)-1)
        s = trajectory(j);
        sp = trajectory(j+1);
        g = GROUPS(s);
        gp = GROUPS(sp);
        theta(g) = theta(g) + alpha * (theta(gp) - theta(g));
    end
    sf = trajectory(length(trajectory));
    gf = GROUPS(sf);
    theta(gf) = theta(gf) + alpha * (reward - theta(gf));
end

end