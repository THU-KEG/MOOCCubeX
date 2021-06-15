import json
import matplotlib.pyplot as plt
from tqdm import tqdm
from collections import Counter
import pickle
import numpy as np

def count_problem():
    with open('relations/user-problem.json') as f:
        for line in tqdm(f, desc="count problem"):
            item = json.loads(line)
            yield item['problem_id']

def count_exercise():
    problem_freq_counter = load_counter(
        'results/problem_freq_counter.pkl',
        lambda: Counter(count_problem())
    )
    p2e = {}
    with open('relations/exercise-problem.txt') as f:
        for line in tqdm(f, desc="count exercise"):
            exercise_id, problem_id = map(str.strip, line.split())
            p2e[problem_id] = exercise_id
    cnt = Counter()
    for k, v in problem_freq_counter.items():
        try:
            cnt[p2e[k]] += v
        except KeyError:
            pass
    return cnt

def count_video():
    vid2ccid = {}
    with open('relations/video_id-ccid.txt') as f:
        for line in tqdm(f, desc="vid2ccid"):
            vid, ccid = line.split()
            vid2ccid[vid] = ccid
    with open('relations/user-video.json') as f:
        for line in tqdm(f, desc="count video"):
            item = json.loads(line)
            for segment in item['seq']:
                if segment['video_id'] not in vid2ccid:
                    pass
                    # print(f"{segment['video_id']} not found")
                else:
                    yield vid2ccid[segment['video_id']]

def pack_counter(counter, scales):
    '''
    >>> pack_counter({'a': 3, 'b': 7, 'c': 1, 'd': 10}, [2, 5])
    array([1., 1., 2.])
    >>> pack_counter({'a': 3, 'b': 7, 'c': 1, 'd': 10}, [1, 5])
    array([0., 2., 2.])
    '''
    x = np.zeros(len(scales)+1)
    i = 0
    for cnt in sorted(counter.values()):
        while i < len(scales) and cnt >= scales[i]:
            i += 1
        x[i] += 1
    return x

def plot_hist(y, scales):
    x = [f'<{scales[0]}'] + [f'{s}~{next_s}' for s, next_s in zip(scales[:-1], scales[1:])] + [f'>={scales[-1]}']
    x = ['~\n'.join(x0.split('~')) if len(x0) > 6 else x0 for x0 in x]
    x, y = list(reversed(x)), list(reversed(y))
    fig = plt.figure(figsize=(12, 8))
    bc = plt.bar(x, y)
    # import pdb; pdb.set_trace()
    for bar, height in zip(bc, y):
        plt.text(bar.xy[0]+bar.get_width()/2, height, str(round(height)), ha='center')
    plt.xlabel('Frequency')
    plt.ylabel('Video Num')
    # fig.tight_layout()

def load_counter(path, gen_func):
    try:
        with open(path, 'rb') as f:
            counter = pickle.load(f)
    except (FileNotFoundError, EOFError):
        counter = gen_func()
        with open(path, 'wb') as f:
            pickle.dump(counter, f)
    return counter

def plot_counter(counter, scales, filename):
    x = pack_counter(counter, scales)
    plot_hist(x, scales)
    plt.savefig(filename, bbox_inches='tight')

if __name__ == '__main__':
    import doctest
    doctest.testmod()
    plt.rcParams.update({
        'font.size': 22,
        'lines.linewidth': 4,
        'lines.markersize': 10,
        'lines.markeredgewidth': 4,
    })
    ccid_freq_counter = load_counter(
        'results/ccid_freq_counter.pkl',
        lambda: Counter(count_video())
    )
    problem_freq_counter = load_counter(
        'results/problem_freq_counter.pkl',
        lambda: Counter(count_problem())
    )
    exercise_freq_counter = load_counter(
        'results/exercise_freq_counter.pkl',
        lambda: count_exercise()
    )
    plot_counter(ccid_freq_counter, [2, 5, 50, 500, 2000, 10000], 'results/ccid_freq.pdf')
    plot_counter(problem_freq_counter, [2, 5, 20, 50, 500, 2000], 'results/problem_freq.pdf')
    plot_counter(exercise_freq_counter, [2, 5, 20, 50, 500, 2000], 'results/exercise_freq.pdf')