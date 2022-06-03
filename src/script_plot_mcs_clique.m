folder = "iso";
T_subiso = readtable(folder + "/clique.csv");
matrix_table = table2array(T_subiso);
probabilities = unique(matrix_table(:, 2));
prob_size = size(probabilities, 1);
colors = distinguishable_colors(3, 'w');
sizes = unique(matrix_table(:, 1));

for idx = 1:size(sizes, 1)
    n = sizes(idx);
    f = figure(idx);
    hold on;
    title_plot = n + " RD vs AIH max clique";
    plot(probabilities, matrix_table((idx-1)*prob_size+1:idx*prob_size, 3), color = colors(1, :));
    hold on;
    plot(probabilities, matrix_table((idx-1)*prob_size+1:idx*prob_size, 4), color = colors(2, :));
    hold on;
    ylim([0, n]);
    xlabel("p");
    ylabel("Size of clique")
    title(title_plot);
    legend(["RD", "AIH"].', 'Location','southwest');
    saveas(f, folder + "/" + title_plot + ".jpg");
    hold off;
end