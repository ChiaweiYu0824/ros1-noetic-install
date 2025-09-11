#!/bin/bash
# ===============================================
# 一鍵安裝 ROS Noetic + catkin_ws (Jetson L4T)
# 適用 Jetson Orin Nano / Docker
# ===============================================

set -e

# 1️⃣ 拉取 ROS Noetic Docker 映像
echo "=== 下載 ROS Noetic Docker 映像 ==="
sudo docker pull dustynv/ros:noetic-desktop-l4t-r35.4.1

# 2️⃣ 建立本地 catkin_ws 資料夾
mkdir -p ~/Docker/catkin_ws/src
echo "=== 本地 catkin_ws 已建立: ~/Docker/catkin_ws ==="

# 3️⃣ 運行 Docker 容器
echo "=== 啟動 ROS Noetic Docker 容器 ==="
echo "請在容器內繼續執行腳本剩餘步驟"
echo "啟動指令："
echo "sudo docker run -it --rm \\"
echo "    --runtime nvidia \\"
echo "    --network host \\"
echo "    --env DISPLAY=\$DISPLAY \\"
echo "    --volume /tmp/.X11-unix:/tmp/.X11-unix \\"
echo "    --volume ~/Docker/catkin_ws:/home/rosuser/catkin_ws \\"
echo "    --privileged \\"
echo "    dustynv/ros:noetic-desktop-l4t-r35.4.1"
echo ""
echo "在容器內請繼續執行以下步驟..."

# 4️⃣ 以下步驟在容器內執行
cat << 'EOF' > ~/Docker/catkin_ws/setup_in_container.sh
#!/bin/bash
set -e

echo "=== 更新系統與安裝依賴 ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential curl gnupg lsb-release usbutils python3-pip

echo "=== 添加 ROS 倉庫與金鑰 ==="
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
sudo apt update

echo "=== 安裝 ROS Noetic 與常用套件 ==="
sudo apt install -y ros-noetic-desktop-full
sudo apt install -y \
  ros-noetic-dynamic-reconfigure \
  ros-noetic-tf \
  ros-noetic-tf2-ros \
  ros-noetic-tf2-geometry-msgs \
  ros-noetic-geometry-msgs \
  ros-noetic-sensor-msgs \
  ros-noetic-std-msgs \
  ros-noetic-message-generation \
  ros-noetic-message-runtime \
  ros-noetic-rosserial \
  ros-noetic-rosserial-arduino \
  ros-noetic-robot-state-publisher \
  ros-noetic-joint-state-publisher \
  ros-noetic-rviz \
  ros-noetic-rqt* \
  python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool python3-catkin-tools

echo "=== 初始化 rosdep ==="
sudo rosdep init || true
rosdep update

echo "=== 設定 ROS 環境 ==="
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "=== 編譯 catkin_ws ==="
cd ~/catkin_ws
rm -rf build/ devel/
catkin_make
source devel/setup.bash

echo "=== 完成 ==="
echo "ROS Noetic + catkin_ws 初始化完成！"
echo "請在每次使用前執行: source ~/catkin_ws/devel/setup.bash"
EOF

chmod +x ~/Docker/catkin_ws/setup_in_container.sh

echo "=== 腳本建立完成 ==="
echo "容器內執行："
echo "cd ~/catkin_ws && ./setup_in_container.sh"
