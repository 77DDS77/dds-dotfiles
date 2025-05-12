#!/bin/bash

#!/bin/bash

echo -e "\033[1;34m📘 TMUX QUICK HELP\033[0m

\033[1;36m───────────── GENERAL ─────────────\033[0m

\033[1;33mPrefix key       \033[0m → Ctrl + A
\033[1;33mNew window       \033[0m → Prefix + c
\033[1;33mRename window    \033[0m → Prefix + ,
\033[1;33mRename session    \033[0m → Prefix + $
\033[1;33mDetach session   \033[0m → Prefix + d
\033[1;33mReload config    \033[0m → Prefix + r

\033[1;36m───────────── PANES ───────────────\033[0m

\033[1;33mVertical split   \033[0m → Prefix + %
\033[1;33mHorizontal split \033[0m → Prefix + \"
\033[1;33mNavigate panes   \033[0m → Prefix + h / j / k / l
\033[1;33mKill pane        \033[0m → Prefix + x

\033[1;36m───────────── WINDOWS ─────────────\033[0m

\033[1;33mNext window      \033[0m → Prefix + n
\033[1;33mPrev window      \033[0m → Prefix + p
\033[1;33mList windows     \033[0m → Prefix + w
\033[1;33mMove window      \033[0m → Prefix + . (then number)

\033[1;36m───────────── SESSIONS ────────────\033[0m

\033[1;33mList sessions    \033[0m → tmux ls
\033[1;33mAttach session   \033[0m → tmux attach -t 
\033[1;33mNew session      \033[0m → tmux new -s 
\033[1;33mKill session     \033[0m → tmux kill-session -t 

\033[1;36m───────────── COPY MODE ───────────\033[0m

\033[1;33mEnter copy mode  \033[0m → Prefix + [
\033[1;33mScroll up/down   \033[0m → ↑ / ↓ or PgUp / PgDn
\033[1;33mStart selection  \033[0m → Space
\033[1;33mCopy selection   \033[0m → Enter
\033[1;33mPaste            \033[0m → Prefix + ]

"

echo -e "\n\033[1;32mPremi INVIO per chiudere...\033[0m"
read

