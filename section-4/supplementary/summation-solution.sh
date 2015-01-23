#!/bin/bash
awk '
    {a[$2] += $7}
    END{
        for(k in a){
            print k, a[k]
        }
    }
' $1 | column -t
