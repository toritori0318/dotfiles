
" tabの表示色を設定
set listchars=tab:>\ ,extends:<,trail:\

" 無名レジスタに入るデータを、*レジスタにも入れる。
:set clipboard+=unnamed

" 3章 vimrcを即座に編集できるようにする
nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>
" 3章 vimrcを即座にリロードできるようにする
nnoremap <Space>s.  :<C-u>source $MYVIMRC<Enter>
" 3章 gvimrcを即座に編集できるようにする
nnoremap <Space>g.  :<C-u>edit $MYGVIMRC<Enter>
" 3章 gvimrcを即座にリロードできるようにする
nnoremap <Space>gs.  :<C-u>source $MYGVIMRC<Enter>

" Hack #96 あらゆる言語に対してキーワードの補完を有効にする
autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif

" いろいろ可視化
set list

" バックアップ設定
set backup
set backupdir=$HOME/.vim/backup
let &directory = &backupdir

"○○ や ××, ■■を全角にする
set ambiwidth=double
" フォント
"set guifont=Consolas:h10:cSHIFTJIS
" バッファを保存しなくても移動できるようにする
set hidden

"行番号を非表示
set number
"括弧入力時に対応する括弧を表示
set showmatch
"コマンドをステータス行に表示
set showcmd
"タイトルを表示
set title
"常にステータス行を表示
set laststatus=2

"if(){}などのインデント
set cindent

"ルーラーを表示
set ruler
set ignorecase

"検索に大文字を含んでいたら大小区別
set smartcase
set noic
"検索時にヒット部位の色を変更
set hlsearch
"検索時にインクリメンタルサーチを行う
set incsearch
set showmode

"コマンドラインの履歴の保存数
set history=256
"インデント
set autoindent
set smartindent
set smarttab

set tabstop=4
"タブを空白に置き換える
set expandtab
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

"ファイル形式別ロードを有効化
filetype plugin indent on
filetype plugin on
syntax on

"ファイルタイプ別辞書ファイル
autocmd FileType c,cpp,perl set cindent
autocmd FileType perl,cgi :set dictionary+=~/.vim/dict/perl_functions.dict
"autocmd FileType perl,cgi :set dictionary+=~/.vim/dict/perl_modules.dict
autocmd FileType perl,cgi :compiler perl
autocmd FileType perl,cgi set isfname-=-

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"辞書ファイルを使用する設定に変更
set complete+=k

"バッファを開いた時に、カレントディレクトリを自動で移動
:au BufEnter *.pl,*.pm,*.cgi,*.yaml,*.json,*.txt,*.tt execute ":lcd " . expand("%:p:h")

"perltidy
nnoremap ,pt <ESC>:%! perltidy<CR>
nnoremap ,ptv <Esc>:'<,'>! perltidy<CR>

" 便利移動
vmap j gj
vmap k gk
nmap j gj
nmap k gk

map <S-Down> <C-w>j
map <S-Up> <C-w>k
map <S-Left> <C-w>h
map <S-Right> <C-w>l

" TT
iab TT [% %]
iab TIF [% IF %][% END %]
iab TIFE [% ELSIF %]
iab TIFL [% ELSE %]
iab TF [% FOREACH %][% END %]
iab TW [% WHILE %][% END %]
iab TS [% SWITCH %][% CASE %][% END %]
iab Ts [% etc %]
iab TI [% INCLUDE "" %]
" print
iab PRINT print $i, "\n";
iab PRINTD print Dumper($i);


" Tabs
nnoremap <silent> ,tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> ,tk :<C-u>tabclose<CR>
nnoremap <silent> ,tn :<C-u>tabnext<CR>
nnoremap <silent> ,tp :<C-u>tabprevious<CR>

" FuzzyFinder.vim
nnoremap <unique> <silent> ,fb :FufBuffer!<CR>
nnoremap <unique> <silent> ,ff :FufFile!<CR>
nnoremap <unique> <silent> ,fm :FufMruFile!<CR>
nnoremap <unique> <silent> ,fc :FufRenewCache<CR>
autocmd FileType fuf nmap <C-c> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'

" # Hack 57 空行を挿入する
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j
" # Hack 97 コマンド（「:」）を再実行
nnoremap c. q:k<Cr>

" 行頭で左に移動すると、前行の一番後ろにカーソルを持っていく設定
set whichwrap=b,s,h,l,<,>,[,],<
" ビジュアルモードで選択した文字列を検索 
vnoremap * y/<C-r>0<CR>

" NERD Tree
nmap <silent> <F3> :<C-u>NERDTreeToggle<CR>


" 括弧の対応をちょっとだけらくちんにする
imap '' ''<Left>
imap "" ""<Left>
"imap {} {}<Left>
"imap () ()<Left>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

"Google翻訳
function! Google_translate(trn) range
    setlocal previewheight=6
    let tmp = @@
    silent normal gvy
    let tx = @@
    let tx = substitute(tx, "\n", ' ', 'g')
    let tx = substitute(tx, '"',  '""', 'g')
    let tx = substitute(tx, "'",  "''", 'g')
    let dst = "GoogleTranslateOutput"
    " preview
    silent execute ":pedit! " . dst
    wincmd P
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal syntax=none
    setlocal bufhidden=delete
    setlocal wrap
    setlocal modifiable
    " perl one liner
    silent execute ':%! perl -MWebService::Simple -e ''exit if @ARGV==0;my $t = WebService::Simple->new(base_url => "http://ajax.googleapis.com/ajax/services/language/translate",response_parser=>"JSON",params=>{v=>"1.0",langpair=>"'.a:trn.'",});my $r=$t->get({q=>$ARGV[0],}); print $r->parse_response->{responseData}->{translatedText};'' ''' . tx . ''' 2>&1 '
    wincmd P
endfunction
"<Leader>teで英語→日本語翻訳
vnoremap <silent> <Leader>te :call Google_translate("en\|ja")<CR>
"<Leader>tjで日本語→英語翻訳
vnoremap <silent> <Leader>tj :call Google_translate("ja\|en")<CR>

" us key
nnoremap ; :


" Windows向け
" 全て選択
map <A-a>  ggvG
" 切り取り
vnoremap <A-x> "+x
" クリップボードコピー／貼り付け
vnoremap <A-c> "+y
map <A-v>		"+gP
map <S-Insert>		"+gP
cmap <A-v>		<C-R>+
cmap <S-Insert>		<C-R>+
exe 'inoremap <script> <A-v>' paste#paste_cmd['i']
exe 'vnoremap <script> <A-v>' paste#paste_cmd['v']
imap <S-Insert>		<A-v>
vmap <S-Insert>		<A-v>

" ctags
set tags=./tags,tags,../tags,~/.vim/tags/perl/cpan.tags

" taglist
nnoremap <silent> <F5> :TlistToggle<CR>
let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 20

" アプリケーション毎の設定
set tags+=/path_to_catalyst/tags
let $PERL5LIB = $PERL5LIB.":/path_to_catalyst/lib"

