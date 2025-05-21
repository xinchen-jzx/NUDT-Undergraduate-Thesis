import matplotlib.pyplot as plt

# Sample data
labels = ['Off-chip Transfer', 'Tensor Manipulate', 'Matrix Processing', 'Vector Processing', 'Other']
sizes = [65, 3, 15, 16, 1]

# Create the pie chart
plt.figure(figsize=(6, 6))
plt.pie(
    sizes,
    labels=labels,
    autopct='%1.0f%%',
    shadow=False,
    startangle=90
)
plt.title('NPU Work Ratio')

# Ensure the pie is drawn as a circle
plt.axis('equal')

plt.savefig('npu_work.png',
            bbox_inches='tight' # 紧凑边距，避免标签被截断
)

# Display the chart
plt.tight_layout()
plt.show()
