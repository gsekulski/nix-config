{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      syntax on
      set ruler
      set noerrorbells
      set novisualbell
      set number
      set incsearch
      set hlsearch
      set ignorecase
      set smartcase
      set nostartofline
      set smarttab
      set expandtab
      set title
      set showcmd
      set ttyfast
      set backspace=indent,eol,start
      set laststatus=2
      set shortmess=at
      set whichwrap=<,>,h,l
      set termencoding=utf-8
      set encoding=utf-8
      set tabstop=4
      set shiftwidth=4
      set softtabstop=4
      set textwidth=80
      set scrolloff=4
      set virtualedit=block
      set switchbuf=useopen
      set undolevels=1000
      set undofile
      set numberwidth=5
      set updatetime=100
      set autoindent
      set history=1000
      set confirm
      set nowrap
      set noinsertmode
      set cdhome
      set autochdir
      set magic
      set notimeout
      set nofoldenable
      set noswapfile
      set notitle
      set mouse=a
      set noshowmode
      set diff
      set mmd=5000
      set ff=unix
    ''; 
  };
}