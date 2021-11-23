# MOOCCubeX 

[论文](https://lfs.aminer.cn/misc/moocdata/publications/mooccubex.pdf) | [English](./README.md)

MOOCCubeX由清华大学知识工程实验室维护，并得到中国最大的MOOC网站之一[学堂在线](www.xuetangx.com)的支持。本资源库包括4,216门课程，230,263个视频，358,265个习题，637,572个细粒度的概念和超过2.96亿的3,330,294个学生的原始行为数据，用于支持MOOC中自适应学习的研究课题。

我们将MOOCCubeX的贡献总结如下。

* 高覆盖率。MOOCCubeX收集了多样化的MOOC资源和外部教育资源，以及学生的学习、练习和讨论的数据记录。
* 规模大。与其他开放的教育数据资源库相比，MOOCCubeX的规模更大，从而支持对数据要求较高的深度模型的探索。
* 以概念为中心：异质数据采用细粒度的概念进行组织，这使得资源更有针对性，更容易表达、查找和建模。

## 新闻 !!

* 完善了数学、心理学和计算机科学的先后修关系！!
* 我们的论文已提交给CIKM2021 resource track！!
* MOOCCubeX数据集生成器工具包已被更新！！
* 我们的论文已录用于CIKM2021 resource track！!

## 资源结构

MOOCCubeX的结构图如下所示。

![Framework](./docs/img/framework.png)

MOOCCubeX的数据使用细粒度概念图谱进行组织。其资源在以下各表列出。

课程资源数据（详见[course.md](./docs/course-cn.md)）。

| 课程资源类型 | 描述 | 下载链接 | 文件大小 |
| -------------------- | ----------- | -------- | ---- |
| 课程信息          | 课程总览，包括视频和习题两种资源 | [entities/course.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/course.json) | 43M |
| 视频                | 包括视频的标题和字幕等信息 | [entities/video.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/video.json) | 580M |
| 习题              | 课程的习题即为[一组问题](./docs/course-cn.md#exercise) | [relations/exercise-problem.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/exercise-problem.txt) | 129M |
| 问题             | 一组习题中包括的问题 | [entities/problem.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/problem.json) | 1.2G |
| 学校               | 学校信息 | [entities/school.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/school.json) | 613K |
| 教师              | 教师信息 | [entities/teacher.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/teacher.json) | 8.7M |
| 学科领域     | 人工标注的课程的（可能多个）所属领域 | [relations/course-field.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/course-field.json) | 62K |

学生行为数据（详见[user.md](./docs/user-cn.md)）。

| 学生行为类型 | 描述 | 下载链接 | 文件大小 |
| --------------------- | ----------- | -------- | ---- |
| 用户画像       | 包括用户的ID, 学校, 课程注册顺序等等 | [entities/user.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/user.json) | 770M |
| 观看视频        | 用户观看视频的倍速以及跳跃着看的信息 | [relations/user-video.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/user-video.json) | 3.0G |
| 做习题            | 用户做习题中的问题的情况 | [relations/user-problem.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/user-problem.json) | 21G |
| 评论               | 用户对视频或习题的评论 | [entities/comment.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/comment.json) | 2.1G |
| 评论回复                 | 用户对其他用户评论的回复 | [entities/reply.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/reply.json) | 50M |
| 小木        | 用户与学堂在线智能问答机器人小木的交互信息 | [relations/user-xiaomu.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/user-xiaomu.json) | 9.7M |

细粒度概念及其与其他MOOC资源的链接信息，也包括其他课外资源。详见[concept.md](./docs/concept-cn.md)。

| 概念及链接 | 描述 | 下载链接 | 文件大小 |
| -------------------------------------- | ----------- | -------- | ---- |
| 概念                                | 从视频字幕中抽取的课程概念 | [entities/concept.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/entities/concept.json) | 156M |
| 概念先后修关系    | 人工标注与算法预测的部分概念先后修关系。包括心理学、数学与计算机科学。 | [prerequisites/psy.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/prerequisites/psy.json) [prerequisites/math.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/prerequisites/math.json) [prerequisites/cs.json](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/prerequisites/cs.json) | 87M 59M 133M |
| 概念与课程链接                         | 课程对应的概念 | [relations/concept-course.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/concept-course.txt) | 19M |
| 概念与视频链接                          | 视频对应的概念 | [relations/concept-video.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/concept-video.txt) | 39M |
| 概念与问题链接                        | 问题对应的概念 | [relations/concept-problem.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/concept-problem.txt) | 1.3M |
| 概念与评论链接                        | 评论对应的概念 | [relations/concept-comment.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/concept-comment.txt) | 1.2M |
| 概念与课外资源链接                         | [课外资源](./docs/concept-cn.md#entitiesotherjson)对应的概念. | [relations/concept-other.txt](https://lfs.aminer.cn/misc/moocdata/data/mooccube2/relations/concept-other.txt) | 19M |

## 工具包

为了方便使用，我们提供2类工具包。

* MOOCCubeX数据集生成器

  | 工具名称 | 描述 | 使用举例 |
  | ------------ | --------------------- | ------------------------- |
  | [download_dataset.sh](./scripts/download_dataset.sh) | 下载整个数据集 | `./scripts/download_dataset.sh` |
  | [count.sh](./scripts/count.sh) | 数课程/视频/等资源的个数 | `./scripts/count.sh` |
  | [user_freq_histgram.py](./scripts/user_freq_histgram.py) | 画视频/问题等用户使用频率统计图(论文Figure 4) | `python3 scripts/user_freq_histgram.py` |
  | [concept_course.py](./scripts/concept_course.py) | 生成`relations/concept-course.txt`的脚本 | `python scripts/concept_course.py` |
  | [concept_finder.sh](./scripts/concept_finder.sh) | 找到包含给定概念的视频的[`ccid`](./docs/course-cn.md#video) | `./scripts/concept_finder.sh K_晶体三极管组态放大器_电子科学与技术` |
  | [course_info_finder.sh](./scripts/course_info_finder.sh) | 找到包含给定字符串的课程信息 | `./scripts/course_info_finder.sh 数据结构` |
  | [video_viewed_by_user_and_course.sh](./scripts/video_viewed_by_user_and_course.sh) | 查询给定用户在给定课程所有观看视频的ID[`resource_id`s](./docs/course-en.md#resource) | `./scripts/video_viewed_by_user_and_course.sh U_94015 C_1824928` |
  | [problems_by_user.sh](./scripts/problems_by_user.sh) | 查询给定用户所有回答过的问题 | `./scripts/problems_by_user.sh U_10000835` |
  | [concepts_of_video.sh](./scripts/concepts_of_video.sh) | 查询给定视频的所有概念 | `./scripts/concepts_of_video.sh V_479945` |
  | [who_replied.sh](./scripts/who_replied.sh) | 查询所有回复过给定用户的其他用户 | `./scripts/who_replied.sh U_10006544` |

_以上部分工具依赖于[`jq`](https://stedolan.github.io/jq/)或其他Python库，例如`matplotlib`和`tqdm`。_

* MOOCube概念帮助器

  * 概念提取流水线：https://github.com/yujifan0326/Concept-Acquisition-Pipeline
  * 概念先后修关系发现工具: https://github.com/luogan1234/prerequisite-prediction-co-training

## 提示和特征

MOOCCubeX的概念和行为数据有一些统计上的特点。

* 与前一版本的MOOCCube相比，MOOCCubeX包含了更细粒度的概念。
* 视频观看行为是长尾分布的，而习题趋于正态分布。

![Plots](./docs/img/three-figures-which-have-to-be-grouped-like-this-otherwise-will-not-align-in-markdown.png)

## 参考文献

```
@inproceedings{10.1145/3459637.3482010,
author = {Yu, Jifan and Wang, Yuquan and Zhong, Qingyang and Luo, Gan and Mao, Yiming and Sun, Kai and Feng, Wenzheng and Xu, Wei and Cao, Shulin and Zeng, Kaisheng and Yao, Zijun and Hou, Lei and Lin, Yankai and Li, Peng and Zhou, Jie and Xu, Bin and Li, Juanzi and Tang, Jie and Sun, Maosong},
title = {MOOCCubeX: A Large Knowledge-Centered Repository for Adaptive Learning in MOOCs},
year = {2021},
isbn = {9781450384469},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
url = {https://doi.org/10.1145/3459637.3482010},
doi = {10.1145/3459637.3482010},
pages = {4643–4652},
numpages = {10},
keywords = {open-access datasets, concept extraction, adaptive learning},
location = {Virtual Event, Queensland, Australia},
series = {CIKM '21}
}
```
