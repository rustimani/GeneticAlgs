function x = findMax(POPULATION_SIZE, P_Cr, P_M, ITER_NUM, DRAW_PLOT)
if nargin == 4
    DRAW_PLOT = false;
end
PLOT_RATE = 60;
CHROMOSOME_LENGTH = 15;
S = (-10:(20/32767):10)'; % множество решений
Populations{1} = floor(rand(POPULATION_SIZE, 1)*32767); % начальная популяция

i = 1;
while i <= ITER_NUM
    Populations{i} = fitness(Populations{i}, S);
    P = selection(Populations{i});
    P = crossingover(P, CHROMOSOME_LENGTH, P_Cr);
    P = mutation(P, CHROMOSOME_LENGTH, P_M);
    i = i + 1;
    Populations{i} = P;
    if DRAW_PLOT == true
        if mod(i, PLOT_RATE) == 0 || i == 2
            figure, plot(S, f(S), 'b')
            hold on, plot(S(Populations{i}(:, 1)), f(S(Populations{i}(:, 1))), 'r*'), hold off
        end
    end
end

x = mode(S(Populations{end}));
end
