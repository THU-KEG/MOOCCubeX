#! /bin/bash

# Usage example:
# ./scripts/concepts_of_video.sh V_479945
# Expected output:
# K_方法_计算机科学与技术
# K_模型_计算机科学与技术
# K_强化学习_计算机科学与技术
# ...

grep '\b'$1'\b' relations/video_id-ccid.txt | cut -f2 | grep -f- relations/concept-video.txt | cut -f1
