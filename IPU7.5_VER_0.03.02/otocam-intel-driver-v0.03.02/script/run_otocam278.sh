#!/bin/bash

# 1. 宣告關聯陣列，定義底層節點字串與 GStreamer 邏輯名稱的一對一固定對應
declare -A CAM_MAP
CAM_MAP["otocam278 a-0"]="otocam278-1"
CAM_MAP["otocam278 b-0"]="otocam278-2"
CAM_MAP["otocam278 c-0"]="otocam278-3"
CAM_MAP["otocam278 d-0"]="otocam278-4"
CAM_MAP["otocam278 a-2"]="otocam278-5"
CAM_MAP["otocam278 b-2"]="otocam278-6"
CAM_MAP["otocam278 c-2"]="otocam278-7"
CAM_MAP["otocam278 d-2"]="otocam278-8"

# 初始化 GStreamer 指令基底
GST_CMD="gst-launch-1.0"
VALID_CAM_COUNT=0

echo "======== 開始進行硬體節點一對一精準比對 ========"

# 2. 遍歷所有的 subdev 節點
for name_file in /sys/class/video4linux/v4l-subdev*/name; do
    if [ -f "$name_file" ]; then
        subdev_name=$(cat "$name_file")
        
        # 排除前後空白，確保比對精準
        subdev_name=$(echo "$subdev_name" | xargs)

        # 3. 檢查定義好的對應表中，是否包含當前的 subdev_name 關鍵字
        for hw_node in "${!CAM_MAP[@]}"; do
            if [[ "$subdev_name" == *"$hw_node"* ]]; then
                # 取得固定的邏輯相機名稱
                cam_name="${CAM_MAP[$hw_node]}"
                
                echo "[ OK ] 匹配成功: '$subdev_name' -> 分配 $cam_name"
                
                # 4. 動態拼入 GST_CMD
                GST_CMD="$GST_CMD icamerasrc num-buffers=-1 device-name=$cam_name io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=2048,height=1536' ! fpsdisplaysink video-sink=glimagesink sync=false"
                
                ((VALID_CAM_COUNT++))
                break # 已匹配到，跳出內層迴圈
            fi
        done
    fi
done

echo "========================================================"
echo "總共成功匹配並啟動 $VALID_CAM_COUNT 顆相機通道。"

# 5. 執行或退出
if [ $VALID_CAM_COUNT -gt 0 ]; then
    echo "啟動 GStreamer 完整指令..."
    echo "--------------------------------------------------------"
    echo "$GST_CMD"
    echo "--------------------------------------------------------"
    eval $GST_CMD
else
    echo "[錯誤] 未能在系統中發現任何匹配的固定的 otocam278 節點，取消啟動。"
    exit 1
fi

