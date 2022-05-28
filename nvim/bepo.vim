" Bépo mapping

" {W} -> [É]
noremap é w
noremap É W

" Use {W} as Ctrl+W :
" Close window
noremap w <C-w>
" Go to next window
noremap W <C-w><C-w>

" [HJKL] -> {CTSR}
" Move to the left
noremap c h
" Move to the right
noremap r l
" Move down (multi-line text)
noremap t gj
" Move up (multi-line text)
noremap s gk

" Move to top of the screen
noremap C H
" Move to bottom of the screen
noremap R L

" join line below to the current one with one space in between
noremap T J

" jump to the previous fold
noremap zs zj
" jump to the next fold
noremap zt zk

" {HJKL} <- [CTSR]
" {J} = « Until »              (j = next, J = previous)
noremap j t
noremap J T
" {L} = « Change »             (l = wait for a move, L = until end of the line)
noremap l c
noremap L C
" {H} = « Replace »            (h = only one char, H = stay in replace mode)
noremap h r
noremap H R
" {K} = « Substitute »         (k = char, K = line)
noremap k s
noremap K S
