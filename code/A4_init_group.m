function [] = A4_init_group(method, nb_groups)
% A4_SETGROUP Initializes the global variable GROUPS.
%   GROUPS maps all states to its corresponding group.
%   'method' is one of {'equal', 'noisy', 'focused'}
%   'nb_groups' is the number of groups to create.

global GROUPS WALK_SIZE

switch method
    case 'equal'
        size = WALK_SIZE / nb_groups;
        GROUPS = ceil((1:WALK_SIZE) / size);
    case 'noisy'
        GROUPS = zeros(1, WALK_SIZE);
        size = WALK_SIZE / nb_groups;
        for i=ceil(size / 2):(WALK_SIZE - ceil(size / 2))
            v = i / size;
            group = ceil(v);
            prob = mod(v, 1);
            if prob < 0.5
                if rand < (0.5 - prob) ^ 2
                    GROUPS(i) = group - 1;
                else
                    GROUPS(i) = group;
                end
            elseif prob > 0.5
                if rand < (prob - 0.5) ^ 2
                    GROUPS(i) = group + 1;
                else
                    GROUPS(i) = group;
                end
            else
                GROUPS(i) = group;
            end
        end
        GROUPS(1:ceil(size/2)) = 1;
        GROUPS((WALK_SIZE - ceil(size / 2)):WALK_SIZE) = nb_groups;
    case 'focused'
        GROUPS = zeros(1, WALK_SIZE);
        splits = [(1:ceil(nb_groups / 2)).^2 (floor(nb_groups / 2):-1:1).^2];
        splits = splits / sum(splits) * WALK_SIZE;
        splits = cumsum(splits);
        s = 1;
        for i=1:WALK_SIZE
            while i > splits(s)
                s = s + 1;
            end
            GROUPS(i) = s;
        end
end

end