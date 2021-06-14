## entities/concept.json

Course concept.

| field | description |
| ----- | ----------- |
| id | Concept ID, the format is `K_{concept name}_{field}` |
| name | Concept name, guaranteed to be the same as the concept name in ID |
| context | The context in which the concept appears in [part of Wiki/Baidu Encyclopedia, Zhihu Q&A](#entitiesotherjson) (50 characters before and after). This string is guaranteed to contain the concept name. |

## entities/other.json

Related materials collected outside the course, including Wikipedia, Baidu Baike, and some Zhihu Q&A. The domains are shown in the table below.

| field | description |
| ----- | ----------- |
| id | Data ID, meaningless |
| concept | The concept on which this information was collected |
| type | Data source, the value is one of `["zhihu", "baike", "wiki"]` |
| content | Data content |

## entities/paper.json

Concept-related papers. The domains are shown in the table below.

| field | description |
| ----- | ----------- |
| id | Paper ID, meaningless |
| concept | association [concept](#entitiesconceptjson)ID |
| abstract | Abstract of the paper |
| authors | The object of the author of the paper, including the author ID and name |
| doi | [DOI logo](https://www.doi.org/) |
| lang | Paper language, `en` is English, `zh` is Chinese |
| pages | Number of paper pages |
| num_citation | Number of citations as of 2020 |
| score | The score of the relevance between the paper and the concept, the higher the more similar |
| sourcetype | The source of the paper, all of which are currently `publication` |
| title | Paper Title |
| venue | Published conferences or journals |
| urls | List of paper URLs |
| year | Paper publication year |

## relations/concept-other.txt

[Concept](#entitiesconceptjson) related to [extracurricular resources](#entitiesotherjson). The format is `{concept ID}\t{resource ID}`.

## relations/concept-paper.txt

[Concept](#entitiesconceptjson) related [thesis](#entitiespaperjson). The format is `{concept ID}\t{paper ID}`.

## relations/concept-problem.txt

[Concept](#entitiesconceptjson) related [problem](./course-cn.md#entitiesproblemjson). The format is `{Concept ID}\t{Question ID}`.

## relations/concept-video.txt

[Concept](#entitiesconceptjson) related [video](./course-cn.md#entitiesvideojson). The format is `{concept ID}\t{ccid}`.

## relations/concept-comment.txt

[Concept](#entitiesconceptjson)Related users[Comments](./user-cn.md#entitiescommentjson). The format is `{concept ID}\t{review ID}`.

## relations/concept-problem.txt

[Concept](#entitiesconceptjson)[problem](./course-cn.md#problem) in related course exercises. The format is `{Concept ID}\t{Question ID}`.