#! /bin/bash

[[ -d entities ]] || mkdir entities
[[ -d relations ]] || mkdir relations
[[ -d prerequisites ]] || mkdir prerequisites
for filename in entities/reply.json entities/video.json entities/comment.json entities/course.json entities/other.json entities/paper.json entities/problem.json entities/school.json entities/teacher.json entities/user.json entities/concept.json relations/course-school.txt relations/course-teacher.txt relations/user-comment.txt relations/video_id-ccid.txt relations/comment-reply.txt relations/concept-other.txt relations/course-comment.txt relations/concept-video.txt relations/exercise-problem.txt relations/user-reply.txt relations/concept-comment.txt relations/concept-paper.txt relations/concept-problem.txt relations/concept-reply.json relations/course-field.json relations/reply-reply.txt relations/user-problem.json relations/user-video.json relations/user-xiaomu.json prerequisites/psy.json prerequisites/cs.json prerequisites/math.json; do
    echo "Downloading ${filename} ..."
    wget -cq "https://lfs.aminer.cn/misc/moocdata/data/mooccube2/${filename}" -O ${filename}
done
