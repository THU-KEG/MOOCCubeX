## entities/user.json

| field | description |
| ----- | ----------- |
| id | 用户ID，以`U_`开头 |
| name | 姓名 |
| gender | 性别 |
| school | 学校 |
| year_of_birth | 出生年月 |
| course_order | 数组，所选课程 |
| enroll_time | 数组，选课时间与`course_order`对应 |

## entities/comment.json

课程[资源](./course-cn.md#resource)的[评论](#comment)。 每一条数据为一个用户对一个[资源](./course-cn.md#resource)的一次[评论](#comment)。 域如下表所示。

| field | description |
| ----- | ----------- |
| id | 评论ID，以`Cm_`开头 |
| user_id | 进行评论的用户ID，以`U_`开头 |
| text | 评论内容 |
| create_time | 评论时间 |

## entities/reply.json

| field | description |
| ----- | ----------- |
| id | 回复ID，以`Rp_`开头 |
| user_id | 用户ID，以`U_`开头 |
| text | 回复内容 |
| create_time | 回复时间 |

### Comment

每个[资源](./course-cn.md#resource)可有多条评论，每条评论即一个用户对该资源的一次评论， 可在`relations/resource-comment.json`中可根据`V_`开头的`video_id`或`Ex_`
开头的`exercise_id`找到对应的评论的`comment_id`。 评论的具体内容可根据该`comment_id`在`entities/comment.json`中找到。

## relations/course-comment.txt

[课程](./course-cn.md#entitiescoursejson)相关[用户评论](#comment)。 格式为`{课程ID}\t{评论ID}`。

## relations/user-comment.txt

[用户](#entitiesuserjson)的[评论](#entitiescommentjson)。 格式为`{用户ID}\t{评论ID}`。

## relations/user-reply.txt

[用户](#entitiesuserjson)的[评论回复](#entitiesreplyjson)。 格式为`{用户ID}\t{回复ID}`。

## relations/comment-reply.txt

[用户评论](#entitiescommentjson)相关[评论回复](#entitiesreplyjson)。 格式为`{评论ID}\t{回复ID}`。

## relations/reply-reply.txt

[用户回复](#entitiesreplyjson)的[回复](#entitiesreplyjson)。 格式为`{回复ID}\t{回复ID}`。

## relations/user-problem.json

| field | description |
| ----- | ----------- |
| log_id | 用户做题记录ID，`user_id` 和 `problem_id` 联合唯一键 |
| user_id | 用户ID，以`U_`开头 |
| problem_id | 问题ID，以`Pm_`开头 |
| is_correct | 做题是否正确 |
| attempts | 做题尝试次数 |
| score | 得分 |
| submit_time | 做题时间 |## relations/user-video.json

## relations/user-video.json

| field | description |
| ----- | ----------- |
| user_id | 用户ID，以`U_`开头 |
| seq | 数组，用户看视频的序列，数组中的每个对象是用户看某个视频的时间序列，包括看视频的时间、视频的起止时间和看视频的速度等 |

## relations/user-xiaomu.json

| field | description |
| ----- | ----------- |
| user_id | 用户ID，以`U_`开头 |
| question_type | 用户问题分类 |
| question | 用户提问的问题 |

