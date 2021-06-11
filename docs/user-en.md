## entities/user.json

| field | description |
| ----- | ----------- |
| id | User ID, starting with `U_` |
| name | Name |
| gender | gender |
| school | school |
| year_of_birth | Birth year and month |
| course_order | Array, selected courses |
| enroll_time | Array, course selection time corresponds to `course_order` |

## entities/comment.json

[Comment](#comment) of course [resource](./course-cn.md#resource). Each piece of data is a [comment](#comment) of a user to a [resource](./course-cn.md#resource). The fields are shown in the table below.

| field | description |
| ----- | ----------- |
| id | Comment ID, starting with `Cm_` |
| user_id | ID of the user who made the comment, starting with `U_` |
| text | Comment content |
| create_time | Comment time |

## entities/reply.json

| field | description |
| ----- | ----------- |
| id | Reply ID, starting with `Rp_` |
| user_id | User ID, starting with `U_` |
| text | Reply content |
| create_time | Reply time |

### Comment

Each [resource](./course-cn.md#resource) can have multiple comments, each comment is a user’s comment on the resource, which can be found in `relations/resource-comment.json`. `video_id` or `Ex_` at the beginning of V_`
The `exercise_id` at the beginning finds the `comment_id` of the corresponding comment. The specific content of the comment can be found in `entities/comment.json` according to the `comment_id`.

## relations/course-comment.txt

[Course](./course-cn.md#entitiescoursejson) related [user comments](#comment). The format is `{course ID}\t{review ID}`.

## relations/user-comment.txt

[Comment](#entitiescommentjson) of [User](#entitiesuserjson). The format is `{User ID}\t{Comment ID}`.

## relations/user-reply.txt

[User](#entitiesuserjson)’s [Comment Reply](#entitiesreplyjson). The format is `{User ID}\t{Reply ID}`.

## relations/comment-reply.txt

[Concept](./concept-cn.md#entitiesconceptjson) related [comment reply](#entitiesreplyjson). The format is `{concept ID}\t{reply ID}`.

A link table of comments sent by users and comments back.

## relations/user-problem.json

| field | description |
| ----- | ----------- |
| log_id | ID of the user's question record, combined with a unique key of `user_id` and `problem_id` |
| user_id | User ID, starting with `U_` |
| problem_id | Problem ID, starting with `Pm_` |
| is_correct | Is the question correct |
| attempts | Number of attempted questions |
| score | score |
| submit_time | Question time |## relations/user-video.json

| field | description |
| ----- | ----------- |
| user_id | User ID, starting with `U_` |
| seq | Array, the sequence of the user watching the video, each object in the array is the time sequence of the user watching a certain video, including the time of watching the video, the start and end time of the video, and the speed of watching the video, etc. |

## relations/user-xiaomu.json

| field | description |
| ----- | ----------- |
| user_id | User ID, starting with `U_` |
| question_type | User question category |
| question | Questions asked by users |
