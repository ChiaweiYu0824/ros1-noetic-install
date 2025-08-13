ROS 2 Humble 安裝與設置指南

目錄

前置條件
1. 安裝
一鍵安裝 ROS 2 Humble 與 Gazebo


2. 建立工作空間
一鍵建立並編譯 ROS 2 工作空間


3. 驗證 ROS 2 安裝
檢查 ROS 2 相關資訊


4. 運行示範節點
C++ 範例
Python 範例


5. 啟動 Gazebo
6. 參考資源

前置條件

作業系統：Ubuntu 22.04 LTS（Jammy Jellyfish）
網路連線：需要下載套件和儲存庫
終端機：用於執行指令的終端機模擬器

1. 安裝
一鍵安裝 ROS 2 Humble 與 Gazebo
以下步驟使用一鍵腳本安裝 ROS 2 Humble 和 Gazebo。
sudo apt install git
git clone https://github.com/ChiaweiYu0824/ros2-humble-install.git
cd ros2-humble-install
chmod +x install_ros2_humble_gazebo.sh
./install_ros2_humble_gazebo.sh

圖片說明：終端機中執行一鍵安裝腳本的畫面
注意：該腳本會自動安裝 ROS 2 Humble、Gazebo 及其依賴項。請在執行前檢查腳本內容以確保安全性。
建議：安裝完成後，載入 ROS 2 環境：
source /opt/ros/humble/setup.bash

將上述指令添加到 ~/.bashrc 以在每次開啟終端機時自動載入：
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

2. 建立工作空間
一鍵建立並編譯 ROS 2 工作空間
以下指令一鍵建立工作空間、複製範例套件並編譯。
mkdir -p ~/ros2_ws/src && cd ~/ros2_ws/src && git clone https://github.com/ros/ros_tutorials.git -b humble && cd ~/ros2_ws && colcon build --symlink-install && source install/setup.bash

圖片說明：終端機中執行工作空間編譯的畫面
注意：--symlink-install 允許快速更新 Python 腳本而無需重新編譯。
建議：將工作空間環境載入指令添加到 ~/.bashrc：
echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

3. 驗證 ROS 2 安裝
檢查 ROS 2 相關資訊
確保 ROS 2 安裝正確並可正常運行。

檢查版本：
ros2 --version

預期輸出：顯示 ROS 2 Humble 的版本資訊（例如 humble）。
圖片說明：終端機中顯示 ROS 2 版本的輸出

檢查套件可執行檔案：
ros2 pkg executables turtlesim

預期輸出：列出 turtlesim 套件中的可執行檔案，例如 turtlesim_node 和 draw_square。


4. 運行示範節點
C++ 範例

啟動發布者（Publisher）：
ros2 run demo_nodes_cpp talker

在一個終端機中運行，模擬發布訊息的節點。

啟動訂閱者（Subscriber）：在另一個終端機中運行：
ros2 run demo_nodes_cpp listener

預期輸出：訂閱者接收並顯示發布者的訊息。
圖片說明：終端機中運行 C++ 發布者和訂閱者的畫面


Python 範例

啟動發布者（Publisher）：
ros2 run demo_nodes_py talker

在一個終端機中運行。

啟動訂閱者（Subscriber）：在另一個終端機中運行：
ros2 run demo_nodes_py listener

預期輸出：訂閱者顯示接收到的訊息，類似 C++ 範例。


注意：每次運行節點前，確保已在終端機中執行 source ~/ros2_ws/install/setup.bash 或已將其添加到 ~/.bashrc。
5. 啟動 Gazebo
運行 Gazebo 模擬器以測試環境設置：
gazebo

預期輸出：Gazebo 圖形介面啟動，顯示空白模擬環境。
圖片說明：Gazebo 模擬器啟動後的空白環境畫面
注意：確保系統已正確安裝顯示驅動程式以支援 Gazebo 的圖形渲染。
6. 參考資源

官方文件：ROS 2 Humble Documentation
問題排查：如遇問題，請參考官方文件或 ROS 社群論壇（例如 ROS Discourse）。
