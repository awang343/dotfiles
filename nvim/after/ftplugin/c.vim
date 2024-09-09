nnoremap <LocalLeader>t :!cp % /tmp/RUNTHIS.c<CR>:vert term<CR>:sleep 50m<CR>id++ /tmp/RUNTHIS.c /tmp/RUNTHIS<CR>
nnoremap <LocalLeader>T :vert term<CR>:sleep 50m<CR>imake<CR>
