clear, clc
POPULATION_SIZE = 100;
P_Cr = 0.6;

P_M = 0.08;
P_M1=0.0002;P_M3=0.8;
CHROMOSOME_LENGTH = 15;

ITER_NUM = 100;
PLOT_RATE = 10;

S=(-10:20/32767:10)'; % множество решений
Populations{1} = floor(rand(POPULATION_SIZE, 1)*32767); % начальная популяция
 figure
i = 1;
while i <= ITER_NUM
    Populations{i} = fitness(Populations{i}, S);
    P = selection(Populations{i});
    P = crossingover(P, CHROMOSOME_LENGTH, P_Cr);
    P = mutation(P, CHROMOSOME_LENGTH, P_M);
    P1 = mutation(P, CHROMOSOME_LENGTH, P_M1); 
    P3 = mutation(P, CHROMOSOME_LENGTH, P_M3); 
    i = i + 1;
    Populations{i}=P3;
    Pop{1,i} = P1;Pop{2,i} = P;Pop{3,i} = P3;
    if mod(i, (ITER_NUM/PLOT_RATE)) == 0 
        figure,
        plot(S, f(S), 'b'); axis([-10 10 -8 2]);
        hold on, plot(S(Pop{2,i}(:, 1)), f(S(Pop{2,i}(:, 1))), 'r*');axis([-10 10 -8 2]);, hold off
%        for j=1:3
%         subplot(3,PLOT_RATE,(fix(i/(ITER_NUM/PLOT_RATE))+(j-1)*PLOT_RATE)),plot(S, f(S), 'b'); axis([-10 10 -8 2]);
%         hold on, plot(S(Pop{j,i}(:, 1)), f(S(Pop{j,i}(:, 1))), 'r*');axis([-10 10 -8 2]);, hold off
%         if fix(i/(ITER_NUM/PLOT_RATE))+(j-1)*PLOT_RATE==(j-1)*10+1 
%             title('низкая вероятность мутации 0.0002')
%         elseif fix(i/(ITER_NUM/PLOT_RATE))+(j-1)*PLOT_RATE==11
%             title('стандартная вероятность мутации 0.08')
%         elseif fix(i/(ITER_NUM/PLOT_RATE))+(j-1)*PLOT_RATE==21
%             title('высокая вероятность мутации 0.8')
%         end   
%        end
    end

end

x = mode(S(Populations{end}));
fprintf('Функция принимает максимальное значение %5.3f в точке %5.3f.\n', f(x), x);
