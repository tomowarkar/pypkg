#!/bin/bash -eu
# @(#) Activate:　chmod +x md2html.sh
# @(#) Usage: ./md2html.sh files..
# https://github.com/jasonm23/markdown-css-themes
# https://github.com/markedjs/marked
# https://highlightjs.org/

md2html() {
    if [ ${1##*.} != "md" ] || [ ! -f $1 ]; then
        echo [error] $1 is not markdown or valid file
        return
    fi

    html_template=$(
        cat <<EOF
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <!-- 全体 css -->
        <link href="https://rawgithub.com/jasonm23/markdown-css-themes/gh-pages/markdown7.css" rel="stylesheet"></link>
        <!-- highlight.js css-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.10/styles/vs.min.css">
        <style>
            .hljs {
                background: none;
            }
            .code-title {
                display: inline-block;
                padding: 2px 4px;
                color:#333;
                transform: translateY(-0.5em);
                padding-bottom: 0;
                font-weight: bold;
                background-color: #999;
            }
        </style>
    </head>
    <body>
        $(cat $1 | marked | sed 's/<code class="language-\([^:]*:\)\([^"]*\)">/<div class="code-title">\2<\/div><code class="language-\1\2">/g')
        <!-- highlight.js パーサー-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.10/highlight.min.js"></script>
        <script>hljs.initHighlightingOnLoad();</script>
    </body>
</html>

EOF
    )
    echo "$html_template" >${1%.*}.html
    echo [sucsess] ${1%.*}.html was generated!!
}

while (("$#")); do
    md2html $1
    shift
done
