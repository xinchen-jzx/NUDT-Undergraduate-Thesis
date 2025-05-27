import matplotlib.pyplot as plt

# Sample data
categories = ['Add',       'Multiply', 'Equal',        'And',     'Quantization',
              'Conv',      'GEMM',     'Full_Connect', 'Exp',     'Sigmoid',
              'Tanh',      'ReLu',     'Leaky_ReLu',   'Softmax', 'Layer_Normalization',
              'ReduceMax', 'ArgueMax', 'Transpose',    'Clip',    'Max_Pooling']
values = [28.51,  26.8,   50.79,  47.08, 11.63,
          753.34, 230.02, 313.67, 17.73, 3.89,
          19.28,  53.21,  12.83,  15.24, 15.46,
          51.03,  2.42,   445.62, 28.97, 41.01]

# Create the bar chart
plt.figure(figsize=(10, 6))
bars = plt.bar(categories, values)

plt.xticks(rotation=45, ha='right')

# Annotate values on top of each bar
for bar in bars:
    height = bar.get_height()
    plt.text(bar.get_x() + bar.get_width() / 2, height + 1, str(height),
             ha='center', va='bottom')

# Labels and title
plt.ylabel('Speedup')

plt.savefig('result.png',
            bbox_inches='tight' # 紧凑边距，避免标签被截断
)

# Adjust layout and display
plt.tight_layout()
plt.show()
