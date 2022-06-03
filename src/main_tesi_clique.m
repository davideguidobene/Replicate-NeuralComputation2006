rng(49487)
max_iter=100;
sizes = [100, 200];
probabilities = [0.25, 0.5, 0.75, 0.9, 0.95];
RD_estimated_clique_number = zeros([size(probabilities, 2) * size(sizes, 2), max_iter]);
AIH_estimated_clique_number = zeros([size(probabilities, 2) * size(sizes, 2), max_iter]);
prob_sizes = zeros([size(probabilities, 2) * size(sizes, 2), 2]);
colors = distinguishable_colors(2, 'w');
folder = "../results";
for idx = 1:size(sizes, 2)
    m = sizes(idx);
    x_0 = zeros([m, 1]) + 1/m;
    for position = 1:size(probabilities, 2)
        p = probabilities(position);
        pos = (idx-1) * size(probabilities, 2) + position;

        prob_sizes(pos, 1) = m;
        prob_sizes(pos, 2) = p;
        for i = 1:max_iter
            G = er_adj_matr(m, p);
            x = x_0;

            c = floor(sqrt((sum(G, 'all')*4+1)/4) + 1/2);
            
            RD_estimated_clique_number(pos, i) = round(find_maximal_clique_RD(G, x_0));
            AIH_estimated_clique_number(pos, i) = round(find_maximal_clique_AIH(G, x_0, c));
        end
    end
    disp(m);
    f = figure(m);
    hold on;
    a = mean(RD_estimated_clique_number, 2);
    plot(probabilities, a(pos - position + 1 : pos), color = colors(1, :));
    hold on;
    a = mean(AIH_estimated_clique_number, 2);
    plot(probabilities, a(pos - position + 1 : pos), color = colors(2, :));
    hold on;
    ylim([0, m]);
    xlabel("p");
    ylabel("Ratio of common nodes")
    title_plot = m + " RD vs AIH max clique";
    title(title_plot);
    legend(["RD", "AIH"].', 'Location','southwest');
    saveas(f, folder + "/" + title_plot + ".jpg");
    hold off;
end
VarNames = {'n', 'p', 'RD_clique_number', 'AIH_clique_number'};
T = table(prob_sizes(:, 1), prob_sizes(:, 2), mean(RD_estimated_clique_number, 2), mean(AIH_estimated_clique_number, 2), 'VariableNames', VarNames);
disp(T);
writetable(T, folder + "/clique.csv");
