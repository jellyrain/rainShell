#!/usr/bin/env bash

load_source() {
    grep "source" <"$1" | while IFS= read -r line; do
        echo "$line"
    done
}

load_context() {
    grep -v "^#" <"$1" | grep -v "^source"
}

load() {
    local i=1

    for path in $(load_source "$1"); do
        if ((i % 2 == 0)); then
            echo "$path"
            load "$path" "$2"
        fi
        ((i++)) || true
    done

    load_context "$1" >>"$2"
}

build() {
    echo "#!/usr/bin/env bash" >"$2"
    load "$1" "$2"
}
