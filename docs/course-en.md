## entities/course.json

Each course includes multiple [resources](#resource). The fields are shown in the table below.

| field | description |
| ----- | ----------- |
| about | Course introduction |
| id | Course ID |
| field | List of the field of the course |
| name | Course name |
| prerequisites | Prerequisite knowledge description |
| resource | List of course [Resource](#resource) |

### Resource

Each resource is either a video or a set of [exercises](#exercise). The fields are shown in the table below.

| field | description |
| ----- | ----------- |
| resource_type | Resource type: either `video` (a [video](#video)) or `exercise` (a group of [exercises](#exercise)) |
| resource_id | ID of the resource |
| chapter | Chapter number |
| titles | A list of titles, including chapter titles, video titles, etc. There are up to 3 levels of headings. |

### Video

If `resource_type` is `video`, it is the video ID starting with `V_`, which is called `video_id` in this article.

Multiple `video_ids` correspond to one `ccid`, and `ccid` uniquely determines a video. These multiple `video_id` correspond to the display of the same `ccid` video at different start times (for example, spring 2018/fall 2020, etc.).
The correspondence between `video_id` and `ccid` can be found in [`relations/video_id-ccid.txt`](#relations/video_id-ccid.txt).

The subtitles of the video can be found in `entities/video.json` through the `ccid`.

### Exercise

Each set of exercises (`exercise`) corresponds to multiple questions ([`problem`](#entitiesproblemjson)). The specific correspondence can be found in `relations/exercise-problem.json` for each `exercise`
Corresponding `problem_id`.

## entities/video.json

The content of the video, its course, chapter and order can be found in [course.json](#resource).

| field | description |
| ----- | ----------- |
| ccid | Unique id of the video |
| name | The name of the video |
| start | Array, the start time of each sentence of the video subtitle |
| end | Array, the time when each sentence of the video subtitle ends |
| text | Array, subtitles of each sentence of the video |

## entities/problem.json

The specific content of [exercise](#exercise) included in the course. Note that each group of exercises ([`exercise`](#exercise)) corresponds to multiple questions ([`problem`](#entitiesproblemjson)). The fields are shown in the table below.

| field | description |
| ----- | ----------- |
| id | Problem ID, starting with `Pm_` |
| exercise_id | Exercise ID, starting with `Ex_` |
| language | The description language of the problem, Chinese/English |
| title | Title of the exercise |
| content | Description of the problem |
| option | Problem option |
| answer | The answer to the question |
| score | The score of the question |
| type | Question options |
| typetext | Question options |
| location | Chapter location of the problem |
| context_id | Array, leaf_id related to the problem |

## entities/school.json

| field | description |
| ----- | ----------- |
| id | School ID, starting with `S_` |
| name | Chinese name of the school |
| name_en | English name of the school |
| sign | The initials of the school's English name |
| about | Introduction |
| motto | School motto |

## entities/teacher.json

| field | description |
| ----- | ----------- |
| id | Teacher ID, starting with `T_` |
| name | Chinese name of the teacher |
| name_en | English name of the teacher |
| about | Teacher profile |
| job_title | job title |
| org_name | affiliation |

## relations/course-field.json

The fields of manually marked courses come from 88 fields in the "Catalogue of Disciplines and Specialties for Granting Doctoral Degrees, Master Degrees and Training Postgraduates" issued by the Ministry of Education in 1997. Each course may belong to multiple fields.

The fields are shown in the table below.

| field | description |
| ----- | ----------- |
| course_id | Course ID |
| course_name | Course name |
| field | Manually labeled field list |

## relations/course-school.txt

[Course](#entitiescoursejson)'s start [School](#entitiesschooljson). The format is `{course ID}\t{school ID}`.

## relations/course-teacher.txt

[Course](#entitiescoursejson)'s start [Teacher](#entitiesteacherjson). The format is `{course ID}\t{teacher ID}`.

## relations/exercise-problem.txt

A set of [problems](#entitiesproblemjson) contained in [exercise](#exercise). The format is `{exercise ID}\t{question ID}`.

## relations/video_id-ccid.txt

[Video ID](#video) and [ccid](#video) correspondence table. The format is `{Video ID}\t{ccid}`.