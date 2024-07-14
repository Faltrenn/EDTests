import matplotlib.pyplot as plt
from matplotlib.ticker import ScalarFormatter

# Ler os dados do arquivo
x_values = []
y_values = []

files = ["insertion"]
files_path = []
for file in files:
    for suffix in ("better", "medium", "worst"):
        files_path.append(file + "-" + suffix + ".txt")


colors = ["r", "g", "b"]

x_values = list(range(1, 101))
for i, file in enumerate(files_path):
    y_values.append([])
    with open("tests/" + file, 'r') as f:
        for line in f:
            y_values[i].append(int(line))
    plt.plot(x_values, y_values[i], color=colors[i], label=file)
plt.xlabel('Tamanho')
plt.ylabel('Tempo(ns)')
plt.title('Gráfico de Linha')
plt.legend()
plt.grid(True)

plt.gca().yaxis.set_major_formatter(ScalarFormatter(useOffset=False))
plt.ticklabel_format(style='plain', axis='y')

plt.ylim(bottom=0)
plt.xlim(left=0, right=x_values[-1])

plt.tight_layout()

#plt.savefig('grafico.png')
plt.show()
