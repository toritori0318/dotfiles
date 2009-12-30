ctags -f ~/.vim/tags/perl/cpan.tags --recurse --totals \
          --exclude=blib \
          --exclude=.svn \
          --exclude=.DS_Store \
          --exclude='*~' \
          --languages=Perl --langmap=Perl:+.t \
          /opt/local/lib/perl5/site_perl/5.8.9/

