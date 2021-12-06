## entities/course.json

每个课程包括多个[资源](#resource)。域如下表所示。

| field | description |
| ----- | ----------- |
| about | 课程介绍 |
| id | 课程ID |
| field | 课程所属领域的list |
| name | 课程名称 |
| prerequisites | 先修知识说明 |
| resource | 课程[资源](#resource)的list |

### Resource

每个资源要么是一个视频，要么是一组[习题](#exercise)。域如下表所示。

| field | description |
| ----- | ----------- |
| resource_type | 资源类型：要么是`video`（一个[视频](#video)），要么是`exercise`（一组[习题](#exercise)） |
| resource_id | 资源的ID |
| chapter | 章节序号 |
| titles | 一个标题的列表，包括章节标题、视频标题等。最多有3级标题。 |

### Video

如果是`resource_type`是`video`，则为`V_`开头的视频ID，本文称其为`video_id`。

多个`video_id`对应一个`ccid`，而`ccid`唯一确定一个视频。 这多个`video_id`对应同一个`ccid`的视频在不同开课时间（例如2018春/2020秋等）的展示。
`video_id`和`ccid`的对应关系可在[`relations/video_id-ccid.txt`](#relations/video_id-ccid.txt)中找到。

视频的字幕可通过该`ccid`在`entities/video.json`中找到。

### Exercise

每组习题(`exercise`)对应多个问题([`problem`](#entitiesproblemjson))。 具体的对应关系可在`relations/exercise-problem.json`中找到每个`exercise`
对应的`problem_id`。

## entities/video.json

视频内容，其所在课程、章节及顺序可在[course.json](#resource)中找到。

| field | description |
| ----- | ----------- |
| ccid | 视频的唯一id |
| name | 视频的名称 |
| start | 数组，视频字幕每句话开始的时间 |
| end | 数组，视频字幕每句话结束的时间 |
| text | 数组，视频每个句子的字幕 |

## entities/problem.json

课程包含的[习题](#exercise)具体内容。 注意，每组习题([`exercise`](#exercise))对应多个问题([`problem`](#entitiesproblemjson))。 域如下表所示。

| field | description |
| ----- | ----------- |
| id | 问题ID，以`Pm_`开头 |
| exercise_id | 习题ID，以`Ex_`开头 |
| language | 问题的描述语言，中文/英文 |
| title | 习题的标题 |
| content | 问题的描述 |
| option | 问题的选项 |
| answer | 问题的答案 |
| score | 问题的分数 |
| type | 问题的题型ID |
| typetext | 问题的题型 |
| location | 问题的章节位置 |
| context_id | 数组，问题相关的leaf_id |

## entities/school.json

| field | description |
| ----- | ----------- |
| id | 学校ID，以`S_`开头 |
| name | 学校的中文名称 |
| name_en | 学校的英文名称 |
| sign | 学校英文名称的首字母缩写 |
| about | 简介 |
| motto | 校训 |

## entities/teacher.json

| field | description |
| ----- | ----------- |
| id | 老师ID，以`T_`开头 |
| name | 老师的中文名 |
| name_en | 老师的英文名 |
| about | 老师简介 |
| job_title | 职称 |
| org_name | 所在单位 |

## relations/course-field.json

人工标注的课程所属领域， 来自教育部1997年发布的《授予博士、硕士学位和培养研究生的学科、专业目录》中的88个领域。 每个课程可能属于多个领域。

域如下表所示。

| field | description |
| ----- | ----------- |
| course_id | 课程ID |
| course_name | 课程名称 |
| field | 人工标注领域列表 |

## relations/course-school.txt

[课程](#entitiescoursejson)的开课[学校](#entitiesschooljson)。 格式为`{课程ID}\t{学校ID}`。

## relations/course-teacher.txt

[课程](#entitiescoursejson)的开课[教师](#entitiesteacherjson)。 格式为`{课程ID}\t{教师ID}`。

## relations/exercise-problem.txt

一组[习题](#exercise)包含的[问题](#entitiesproblemjson)。 格式为`{习题ID}\t{问题ID}`。

## relations/video_id-ccid.txt

[视频ID](#video)与[ccid](#video)对应表。 格式为`{视频ID}\t{ccid}`。
