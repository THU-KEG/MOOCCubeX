#! /bin/bash

# Usage example:
# ./scripts/problems_by_user.sh U_10000835
# Expected output:
# {"log_id":"10000835_3547813","problem_id":"Pm_3547813","user_id":"U_10000835","is_correct":1,"attempts":1,"score":50,"submit_time":"2020-05-04 01:04:01"}
# {"log_id":"10000835_3548507","problem_id":"Pm_3548507","user_id":"U_10000835","is_correct":1,"attempts":2,"score":50,"submit_time":"2020-05-04 13:41:02"}
# ...

jq -cr 'select(.user_id=="'$1'")' relations/user-problem.json
