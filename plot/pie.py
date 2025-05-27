import matplotlib.pyplot as plt

labels = ['Off-chip Transfer', 'Tensor Manipulate', 'Matrix Processing', 'Vector Processing', 'Other']
sizes = [65, 3, 15, 16, 1]

# Create the pie chart
plt.figure(figsize=(6, 6))
plt.pie(
    sizes,
    labels=labels,
    autopct='%1.0f%%',
    shadow=False,
    startangle=90,
    textprops={'fontsize': 18}  # 设置字体大小
)

# Ensure the pie is drawn as a circle
plt.axis('equal')

plt.savefig('npu_work.svg', bbox_inches='tight')

# Display the chart
plt.tight_layout()
plt.show()
