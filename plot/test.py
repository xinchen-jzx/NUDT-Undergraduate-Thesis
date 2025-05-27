import matplotlib.pyplot as plt
import matplotlib.patches as patches

# Create figure and axis
fig, ax = plt.subplots(figsize=(8, 6))

# Define rectangles
rects = {
    "On-chip\nSRAM": (0.1, 0.8, 0.3, 0.1),
    "pSRAM/DDR\nController": (0.5, 0.8, 0.4, 0.1),
    "AXI\nBus": (0.1, 0.65, 0.8, 0.05),
    "RISC-V +\nCIM NPU": (0.2, 0.4, 0.6, 0.15),
    "AHB\nBus": (0.1, 0.25, 0.8, 0.05),
    "APB\nBus": (0.1, 0.05, 0.8, 0.05)
}

# Draw rectangles
for label, (x, y, w, h) in rects.items():
    ax.add_patch(patches.Rectangle((x, y), w, h, fill=False))
    ax.text(x + w/2, y + h/2, label, ha='center', va='center')

# Draw arrows
arrows = [
    ((0.2, 0.75), (0.2, 0.65)),
    ((0.8, 0.75), (0.8, 0.65)),
    ((0.5, 0.55), (0.5, 0.4)),
    ((0.2, 0.3), (0.2, 0.25)),
    ((0.8, 0.3), (0.8, 0.25)),
    ((0.2, 0.15), (0.2, 0.1)),
    ((0.8, 0.15), (0.8, 0.1))
]

for start, end in arrows:
    ax.annotate("", xy=end, xytext=start, arrowprops=dict(arrowstyle="->"))

# Formatting
ax.axis('off')
plt.tight_layout()
plt.show()
