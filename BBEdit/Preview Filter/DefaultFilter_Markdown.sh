#!/bin/bash
PATH=$PATH:/usr/local/bin

pandoc -f markdown -t html -C --metadata link-citations=true "--csl=$HOME/Dropbox/Application Support/BBEdit/Pandoc/config/csl/associacão-brasileira-de-normas-tecnicas-para-estudos-classicos.csl" "--bibliography=$HOME/Dropbox/Application Support/BBEdit/Pandoc/config/refs/All.json" 