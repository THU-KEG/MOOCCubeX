#! /bin/bash

# Usage example:
# ./scripts/concept_finder.sh K_晶体三极管组态放大器_电子科学与技术
# Expected output:
# 3C5B8580413E4A969C33DC5901307461

grep $1 relations/concept-video.txt | cut -f2
