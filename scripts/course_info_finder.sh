#! /bin/bash

# Usage example:
# ./scripts/course_info_finder.sh 数据结构
# Expected output:
# {"id":"C_682649","name":"数据结构(上)","about":"本课程旨在围绕各类数据结构的设计与实现，揭示其中的规律原理与方法技巧；同时针对算法设计及其性能分析，使学生了解并掌握主要的套路与手段。","field":[]}
# {"id":"C_694156","name":"数据结构与算法","about":"《数据结构与算法》主要讨论抽象数据关系和算法在计算机中的表示与实现，具体包括线性表、栈、队列、树、图、查找和排序六个知识模块。","field":[]}
# {"id":"C_696773","name":"数据结构（Data Structures）","about":"在这门课程中，你将学习到数据的基本的存储和计算的方法，掌握线性表、栈、队列、树、图等基本的数据结构以及相关的基本算法。","field":["计算机科学与技术"]}
# ...

jq -c 'select(.name | contains("'$1'")) | {id,name,about,field}' entities/course.json
