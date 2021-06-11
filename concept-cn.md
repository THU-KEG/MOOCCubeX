## entities/concept.json

课程概念。

| field | description |
| ----- | ----------- |
| id | 概念ID，格式为`K_{概念名}_{所属领域}` |
| name | 概念名，保证与ID中概念名相同 |
| context | 概念在[部分维基/百度百科、知乎问答](#entities/other.json)中出现的上下文（前后50个自字符）。此字符串保证包含概念名。 |

## entities/other.json

课程外收集的相关资料，包括维基百科、百度百科、部分知乎问答。 域如下表所示。

| field | description |
| ----- | ----------- |
| id | 资料ID，无实际意义 |
| concept | 收集本条资料所依据的概念 |
| type | 资料来源，取值为`["zhihu", "baike", "wiki"]`中的一个 |
| content | 资料内容 |

## entities/paper.json

概念相关的论文。 域如下表所示。

| field | description |
| ----- | ----------- |
| id | 论文ID，无实际意义 |
| concept | 关联[概念](#entities/concept.json)ID |
| abstract | 论文摘要 |
| authors | 论文作者的object，包含作者ID和姓名 |
| doi | [DOI标识](https://www.doi.org/) |
| lang | 论文语言，`en`为英文，`zh`为中文 |
| pages | 论文页数 |
| num_citation | 截至2020年的被引用数量 |
| score | 论文与概念相关度的得分，越高越相似 |
| sourcetype | 论文来源，目前全部为`publication` |
| title | 论文标题 |
| venue | 所发表会议或期刊 |
| urls | 论文URL列表 |
| year | 论文发表年份 |

## relations/concept-other.txt

[概念](#entities/concept.json)相关[课外资源](#entities/other.json)。 格式为`{概念ID}\t{资源ID}`。

## relations/concept-paper.txt

[概念](#entities/concept.json)相关[论文](#entities/paper.json)。 格式为`{概念ID}\t{论文ID}`。

## relations/concept-problem.txt

[概念](#entities/concept.json)相关[问题](./course.md#entities/problem.json)。 格式为`{概念ID}\t{问题ID}`。

## relations/concept-video.txt

[概念](#entities/concept.json)相关[视频](./course.md#entities/video.json)。 格式为`{概念ID}\t{ccid}`。

## relations/concept-comment.txt

[概念](#entities/concept.json)相关用户[评论](./user.md#entities/comment.json)。 格式为`{概念ID}\t{评论ID}`。

## relations/concept-problem.txt

[概念](#entities/concept.json)相关课程习题中的[问题](./course.md#problem)。 格式为`{概念ID}\t{问题ID}`。
