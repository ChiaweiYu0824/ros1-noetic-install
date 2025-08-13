# ROS 2 Humble Installation & Verification Guide

## 📖 Overview
This guide provides step-by-step instructions for installing **ROS 2 Humble** with Gazebo support, building a sample workspace, and verifying the installation using demo nodes and `turtlesim`.  
It is designed for developers working with **Ubuntu 22.04** or compatible platforms.

---

## 🖥 System Requirements
- **OS**: Ubuntu 22.04 LTS (64-bit)
- **Processor**: Dual-core or higher
- **RAM**: 4 GB minimum (8 GB recommended)
- **Disk Space**: 5 GB free space
- **Network**: Internet connection for package installation

---

## 1️⃣ Install

Clone and run the installation script:
```bash
sudo apt install git
git clone https://github.com/ChiaweiYu0824/ros2-humble-install.git
cd ros2-humble-install
chmod +x install_ros2_humble_gazebo.sh
./install_ros2_humble_gazebo.sh
```

---

## 2️⃣ Build

Create and build the ROS 2 workspace:
```bash
mkdir -p ~/ros2_ws/src
cd ~/ros2_ws/src
git clone https://github.com/ros/ros_tutorials.git -b humble
cd ~/ros2_ws
colcon build
source install/setup.bash
```

---

## 3️⃣ Check

### 3.1 Verify ROS 2 Installation
1. **Check ROS 2 version**
```bash
ros2 --version
```
2. **List executables in turtlesim**
```bash
ros2 pkg executables turtlesim
```

---

### 3.2 Run Demo Nodes

#### C++ Example
**Publisher**
```bash
ros2 run demo_nodes_cpp talker
```
**Subscriber** (in another terminal)
```bash
ros2 run demo_nodes_cpp listener
```

#### Python Example
**Publisher**
```bash
ros2 run demo_nodes_py talker
```
**Subscriber** (in another terminal)
```bash
ros2 run demo_nodes_py listener
```

---

### 3.3 Run Turtlesim

**Turtlesim Node**
```bash
ros2 run turtlesim turtlesim_node
```
**Turtle Teleop** (in another terminal)
```bash
ros2 run turtlesim turtle_teleop_key
```

---

## 4️⃣ Launch Gazebo
```bash
gazebo
```

---

## ⚠️ Notes
- Always run `source install/setup.bash` after building your workspace to load environment variables.
- For multi-terminal workflows, ensure each terminal has sourced the correct setup file.
- When running simulation nodes, ensure no conflicting ROS 2 nodes are already active.

---

## 📚 References
- [ROS 2 Humble Documentation](https://docs.ros.org/en/humble/index.html)
- [Gazebo Documentation](https://gazebosim.org/home)
- [ROS 2 Tutorials](https://docs.ros.org/en/humble/Tutorials.html)

---

## 📜 License
This guide is released under the **MIT License**. You are free to use, modify, and distribute it with attribution.

---
