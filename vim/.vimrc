"vimrc by maojun
"site maojun.xyz
"Last Update: 2019-07-21 20:57:25

"let g:tmuxline_powerline_separators = 0
set pastetoggle=<F9> "�л�pasteģʽ,����ճ��ʱ�Ű����
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w" 
    if &filetype == 'c' 
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'java' 
        exec '!javac %&&java %:r'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif                                                                              
endfunc 


set shell=/bin/sh "����shellΪsh

"autocmd vimenter * NERDTree "��vim����NERDTtree
" ��ֹ������
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" ��ֹ��ʾ�˵��͹�����
set guioptions-=m
set guioptions-=T

autocmd BufWritePost $MYVIMRC source $MYVIMRC "��vimrc����w�����������Ч
let mapleader=";" "����leader��
set expandtab "ʹ�ÿո�����Ʊ��
set cursorline  " ������ʾ��ǰ��
"set cursorcolumn �� ������ʾ��ǰ��
set number "��ʾ�к�
set nowrap "��ֹ����
syntax enable "�����﷨����
syntax on " ������ɫ�����滻Ĭ�ϸ���
set background=dark "���ñ���ɫ
colorscheme solarized "���ô�������
set nocompatible "ȥ����Vi����ģʽ
set incsearch "����ʱֱ����ʾ
set hlsearch "��������
set ruler "��ʾ״̬�����
set relativenumber "����к�
set noswapfile "������swap�ļ�
set ignorecase "����ʱ���Դ�Сд
set smartcase "����ָ����Сдʱƥ���Сд
set smartindent  "�Զ���������
set laststatus=2 "��ʾ״̬��
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %l,%c/%L%) "����״̬����ʾ����Ϣ��·�� �ļ��� �ļ���ʽ ���� �к�,�к�/������
set t_Co=256 "����256ɫ
set showmatch "ƥ���Ӧ���Ÿ���
filetype on "�����ļ����ͼ��
filetype plugin on "��ͬ���ļ����ͼ��ز�ͬ�Ĳ��
filetype indent on " ����Ӧ��ͬ���������� ����python����������~/.vim/indent/python.vim
"set spell spelllang=en_us,cjk "Ӣ��ƴд���,cjk��������
set autoread "�ļ����ӣ��ڱ༭ʱ���޸ĺ���ʾ
au CursorHold,CursorHoldI * checktime "���ֹͣʱ����autoread,Ĭ��4s����һ��
set wildmenu  "����ģʽָ���Զ���ȫ
set wildmode=longest:list,full
set scrolloff=3 "����ƶ���buffer�Ķ����͵ײ�ʱ����3�о���
set report=0 "���ƻ�ɾ����ʱ�ײ���ʾ�����仯
set nrformats= "���������ֶ�����ʮ����
set history=1024 "������������ʷ��¼����Ϊ1024��


" �����������﷨���д����۵�
set foldmethod=indent  
set foldmethod=syntax 
set nofoldenable " ���� vim ʱ�ر��۵�����

" ͳһ����
set tabstop=4 " �����Ʊ��ռ�õĿո���
set softtabstop=4 " �����������Ŀո���Ϊһ���Ʊ��
set shiftwidth=4 " ���ø�ʽ��ʱ�Ʊ��ռ�õĿո���

set termencoding=utf-8 "����Ϊutf-8����"
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"һЩ�ű����½�pyhton�ļ��Զ���ͷ
"func SetTitle()
"call setline(1, "\#!/usr/bin/python")
"call setline(2, "\# -*- coding=utf8 -*-")
"call setline(3, "\"\"\"")
"call setline(4, "\# @Author : ")
"call setline(5, "\# @Created Time : ".strftime("%Y-%m-%d %H:%M:%S"))
"call setline(6, "\# @Description : ")
"call setline(7, "\"\"\"")
"normal G
"normal o
"normal o
"endfunc
"autocmd bufnewfile *.py call SetTitle()

""""
"�½�.c,.h,.sh,.java�ļ����Զ������ļ�ͷ
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""���庯��SetTitle���Զ������ļ�ͷ
func SetTitle()
    "����ļ�����Ϊ.sh�ļ�
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: Jun Mao")
        call append(line(".")+2, "\# mail: maojunxyz@gmail.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: Jun Mao")
        call append(line(".")+2, "    > Mail: maojunxyz@gmail.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "�½��ļ����Զ���λ���ļ�ĩβ
    autocmd BufNewFile * normal G
endfunc

