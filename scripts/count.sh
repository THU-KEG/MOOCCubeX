#! /bin/bash

echo "课程数：" $(wc -l entities/course.json) &
echo "有字幕的ccid数: " $(jq -cr .ccid entities/video.json | sort | uniq | wc -l) &
echo "所有ccid数(video_id-ccid): " $(cat relations/video_id-ccid.txt | cut -f2 | sort | uniq | wc -l) &
echo "course里记载的video_id数：" $(jq -cr '.resource [] | select(.resource_id | startswith("V_")) | .resource_id' entities/course.json | sort | uniq | wc -l) &
echo "所有video_id数(video_id-ccid): " $(cat relations/video_id-ccid.txt | cut -f1 | sort | uniq | wc -l) &
echo "exercise数： $(jq -cr .exercise_id entities/problem.json | sort | uniq | wc -l)" &
echo "problem数： $(jq -cr .id entities/problem.json | sort | uniq | wc -l)" &
echo 总学生数: $(jq -c .id entities/user.json | sort | uniq | wc -l) &
echo 用户行为——comment总数： $(wc -l < relations/user-comment.txt) &
echo 用户行为——reply总数： $(wc -l < relations/user-reply.txt) &
echo 用户行为——做problem总数： $(wc -l < relations/user-problem.json) &
echo 用户行为——看video总数： $(wc -l < relations/user-video.json) &
echo 用户行为——问xiaomu总数： $(wc -l < relations/user-xiaomu.json) &
echo "概念数: " $(jq -c .id entities/concept.json | sort | uniq | wc -l) &
echo "被标注的先后修概念数——计算机" $(jq .c2 additional_information/cs.json | sort | uniq | wc -l) &
echo "被标注的先后修概念数——数学" $(jq .c2 additional_information/math.json | sort | uniq | wc -l) &
echo "被标注的先后修概念数——心理学" $(jq .c2 additional_information/psy.json | sort | uniq | wc -l) &
