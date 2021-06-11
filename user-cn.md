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

课程[资源](./course.md#resource)的[评论](#comment)。 每一条数据为一个用户对一个[资源](./course.md#resource)的一次[评论](#comment)。 域如下表所示。

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

每个[资源](./course.md#resource)可有多条评论，每条评论即一个用户对该资源的一次评论， 可在`relations/resource-comment.json`中可根据`V_`开头的`video_id`或`Ex_`
开头的`exercise_id`找到对应的评论的`comment_id`。 评论的具体内容可根据该`comment_id`在`entities/comment.json`中找到。

## relations/course-comment.txt

[课程](./course.md#entities/course.json)相关[用户评论](#comment)。 格式为`{课程ID}\t{评论ID}`。

## relations/user-comment.txt

[用户](#entities/user.json)的[评论](#entities/comment.json)。 格式为`{用户ID}\t{评论ID}`。

## relations/user-reply.txt

[用户](#entities/user.json)的[评论回复](#entities/reply.json)。 格式为`{用户ID}\t{回复ID}`。

## relations/comment-reply.txt

[概念](./concept.md#entities/concept.json)相关[评论回复](#entities/reply.json)。 格式为`{概念ID}\t{回复ID}`。

用户所发评论与回评论的链接表。

## relations/user-problem.json

| field | description |
| ----- | ----------- |
| log_id | 用户做题记录ID，`user_id` 和 `problem_id` 联合唯一键 |
| user_id | 用户ID，以`U_`开头 |
| problem_id | 问题ID，以`Pm_`开头 |
| is_correct | 做题是否正确 |
| attempts | 做题尝试次数 |
| score | 得分 |
| submit_time | 做题时间 |

## relations/user-video.json

**TODO: 威哥帮忙说明一下这个文件，填一下表**

**TODO: 威哥把user_id变成U_开头的吧，uid换成user_id，video_id变成V_开头的**

| field | description |
| ----- | ----------- |
| | |

## relations/user-xiaomu.json

**TODO: 威哥帮忙说明一下这个文件，填一下表**

**TODO: 威哥把user_id变成U_开头的吧，problem_id变成Pm_开头的**

| field | description |
| ----- | ----------- |
| | |

**TODO: 威哥把下面这几个表解释一下吧，这几个我不熟😂**

## relations/student_video_activity.json

## relations/student_video_id_map_all.json

## relations/student_video_id_map_one.json

## relations/video_activity_new.json

**TODO: 把course_id转成新版本的course_id吧，这里video_id是ccid，变成和其他ccid统一的格式吧**

## relations/problem_id_map_all.json

## relations/problem_id_map_one.json