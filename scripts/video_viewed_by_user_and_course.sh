#! /bin/bash

# Usage example:
# ./scripts/video_viewed_by_user_and_course.sh U_94015 C_1824928
# Expected output:
# V_5623263
# V_5623273
# V_5623277

jq -cr 'select(.user_id=="'$1'") | .seq [] | .video_id' relations/user-video.json | grep -f <(jq -cr 'select(.id=="'$2'").resource [] | .resource_id' entities/course.json | sed -e 's/$/\\b/')
