#!/usr/bin/env bash
git=$(command -v git)
i=1
while [ $i -ne 20 ]
do
        i=$(($i+1))
        echo "Iteration: $i"
        ${git} checkout -b feature/custom-change-$i
        ${git} branch
        echo "## dummy change, iteration ==> $i" >> .github/workflows/status_checks.yml
        git ci -m "dummy change ${i}" .github/workflows/status_checks.yml
        git push origin feature/custom-change-${i}
done
