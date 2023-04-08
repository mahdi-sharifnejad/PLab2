#! /bin/bash

read_graph() {
    read n

    for ((i = 0; i < n; i++)); do
        read graph[$i]
    done
}

print_graph() {

    echo "Source: $source"
    echo "Destination: $destination"
}



bfs() {
    for ((i = 0; i < n; i++)); do
        parent[$i]=-1
    done

    queue=()

    queue+=($source)

    while (( ${#queue[@]} > 0 )); do
        node=${queue[0]}
        queue=(${queue[@]:1})

        for ((i = 0; i < n; i++)); do
            if (( ${graph[$node]:$i:1} == 1 )) && (( ${parent[$i]} == -1 )); then
                parent[$i]=$node

                (( $i == $destination )) && return
                queue+=($i)
            fi
        done
    done
}


print_path() {
    if (( ${parent[$destination]} == -1 )); then
        echo "No path found"
        return
    fi

    path=()

    node=$destination

    while (( $node != $source )); do
        path=($node ${path[@]})

        node=${parent[$node]}
    done

    path=($source ${path[@]})

    echo ${path[@]}
}

source=$1
destination=$2

read_graph
print_graph

bfs

print_path