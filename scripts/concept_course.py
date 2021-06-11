import json
from collections import defaultdict
from tqdm import tqdm
import pickle
vid2ccid = {}
ccid2vid = defaultdict(set)

with open('relations/video_id-ccid.txt') as f:
    for line in tqdm(f, desc="vid2ccid"):
        vid, ccid = map(str.strip, line.split('\t'))
        vid2ccid[vid] = ccid
        ccid2vid[ccid].add(vid)

vid2course_id, course2vid = {}, defaultdict(set)
# ccid2course, course2ccid = defaultdict(set), defaultdict(set)
with open('entities/course.json') as f:
    for line in tqdm(f, desc="vid2course"):
        item = json.loads(line)
        course_id = item['id']
        for res in item['resource']:
            if res['resource_id'].startswith('V_'):
                vid = res['resource_id']
                vid2course_id[vid] = course_id
                course2vid[course_id].add(vid)

concept2course, course2concept = defaultdict(set), defaultdict(set)
ccid2concept, concept2ccid = defaultdict(set), defaultdict(set)
with open('relations/concept-video.txt') as f:
    for line in tqdm(f, desc="concept2course"):
        concept_id, ccid = map(str.strip, line.split('\t'))
        for vid in ccid2vid[ccid]:
            try:
                course_id = vid2course_id[vid]
            except KeyError:
                continue
            concept2course[concept_id].add(course_id)
            course2concept[course_id].add(concept_id)
        ccid2concept[ccid].add(concept_id)
        concept2ccid[concept_id].add(ccid)

with open('relations/concept-course.txt', 'w') as f:
    for course_id, concepts in course2concept.items():
        for concept_id in concepts:
            f.write(f'{concept_id}\t{course_id}\n')