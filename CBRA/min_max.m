function [v_max, t_max, index_v] = min_max(Cp_ctnt, t)

diffCp_ctnt = diff(Cp_ctnt);
idx_mins = [];

for idx_min = 1:length(diffCp_ctnt)-1
    if diffCp_ctnt(idx_min)*diffCp_ctnt(idx_min+1)<0
        disp(idx_mins)
        idx_mins = [idx_mins, idx_min+1];
    end
end

t_max = [];
v_max = [];

%% Edit by Nicola
extreme_points = table(t(idx_mins), Cp_ctnt(idx_mins), 'VariableNames', {'time', 'points'});
if height(extreme_points) > 1
    extreme_points = sortrows(extreme_points, {'points'}, {'desc'});
    extreme_points = extreme_points(1:2,:);
    extreme_points = sortrows(extreme_points, {'time'}, {'asc'});
end

v_max(1) = extreme_points.points(1);
t_max(1) = extreme_points.time(1);

if length(idx_mins) > 1
    v_max(2) = extreme_points.points(end);
    t_max(2) = extreme_points.time(end);
else
    v_max(2) = v_max(1);
    t_max(2) = t_max(1);
end

% [v_max(1), id] = max(Cp_ctnt);
% t_max(1) = t(id);

% if length(idx_mins) > 1
%     t_max(2) = t(idx_mins(end));
%     v_max(2) = Cp_ctnt(idx_mins(end));
% else
%     t_max(2) = 0;
%     v_max(2) = 0;
% end

index_v = find(ismember(t, t_max));