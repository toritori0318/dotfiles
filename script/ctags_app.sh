ctags --recurse --totals \
          --exclude=blib \
          --exclude=.svn \
          --exclude=.DS_Store \
          --exclude='*~' \
          --languages=Perl --langmap=Perl:+.t \
          /path/to/catalyst_root/lib/
