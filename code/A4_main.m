% MDP and Algorithms parameters
global WALK_SIZE JUMP_SIZE GROUPS;
WALK_SIZE = 1000;
JUMP_SIZE = 100;
alpha = 2e-4;
nb_episodes = 1e5;

% Evaluation parameters
methods = {'equal' 'noisy' 'focused'};
group_sizes = [5 10 50];
convergence_steps = [1000 1000 2000 4000 8000 16000];

figure()
title('Monte Carlo - Variance 1')
hold on
A4_init_group('equal', 10);
for j=1:5
    theta = A4_mc(alpha, 5000);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off
figure()
title('Monte Carlo - Variance 2')
hold on
A4_init_group('equal', 5);
for j=1:5
    theta = A4_mc(alpha, 5000);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('TD - Variance 1')
hold on
A4_init_group('equal', 10);
for j=1:5
    theta = A4_mc(alpha, 5000);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off
figure()
title('TD - Variance 2')
hold on
A4_init_group('equal', 5);
for j=1:5
    theta = A4_td(alpha, 5000);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('Monte Carlo - Convergence 1')
hold on
A4_init_group('equal', 10);
theta = zeros(1, 10);
for c=convergence_steps
    theta = A4_mc(alpha, c, theta);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off
figure()
title('Monte Carlo - Convergence 2')
hold on
A4_init_group('equal', 50);
theta = zeros(1, 50);
for c=convergence_steps
    theta = A4_mc(alpha, c, theta);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('Temporal Difference - Convergence 1')
hold on
A4_init_group('equal', 10);
theta = zeros(1, 10);
for c=convergence_steps
    theta = A4_td(alpha, c, theta);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off
figure()
title('Temporal Difference - Convergence 2')
hold on
A4_init_group('equal', 50);
theta = zeros(1, 50);
for c=convergence_steps
    theta = A4_td(alpha, c, theta);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('Monte Carlo - Groups')
hold on
for g=group_sizes
    A4_init_group('equal', g);
    theta = A4_mc(alpha, nb_episodes);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('Temporal Difference - Groups')
hold on
for g=group_sizes
    A4_init_group('equal', g);
    theta = A4_td(alpha, nb_episodes);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

saved_groups = zeros(length(methods), WALK_SIZE);
for m=1:length(methods)
    A4_init_group(methods{m}, 10);
    saved_groups(m, :) = GROUPS;
end
figure()
title('Groups')
imagesc(saved_groups);

figure()
title('Monte Carlo - Methods')
hold on
for m=1:length(methods)
    GROUPS = saved_groups(m,:);
    theta = A4_mc(alpha, nb_episodes);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off

figure()
title('Temporal Difference - Methods')
hold on
for m=1:length(methods)
    GROUPS = saved_groups(m,:);
    theta = A4_td(alpha, nb_episodes);
    y = zeros(1, WALK_SIZE);
    for i=1:WALK_SIZE
        y(i) = theta(GROUPS(i));
    end
    plot(1:1000, y)
end
hold off