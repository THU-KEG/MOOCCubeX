#! /bin/bash

# Usage example:
# ./scripts/who_replied.sh U_10006544
# Expected output:
# U_10006528
# U_10006541
# U_10006544
# U_10006615

grep $1 relations/user-comment.txt | cut -f2| sed -e 's/$/\\b/' | grep -f- relations/comment-reply.txt | cut -f2 | grep -f- relations/user-reply.txt | cut -f1 | sort | uniq