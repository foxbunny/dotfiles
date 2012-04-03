python << EOF
import os
import sys
import vim
for p in sys.path:
    # Add each directory in sys.path, if it exists.
    if os.path.isdir(p):
    # Command 'set' needs backslash before each space.
        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF

if getline(1) =~ 'from django.core import meta'
Iabbr addmodel class <>(meta.Model):<CR><><CR><CR>def __repr__(self):<CR>return "%s" % (<>)<CR><CR>class META:<CR>admin = meta.Admin()
Iabbr mcf meta.CharField(maxlength=<>)<CR><>
Iabbr mif meta.ImageField(upload_to='<>')<CR><>
Iabbr mff meta.FileField(upload_to='<>')<CR><>
Iabbr mint meta.IntegerField()<CR><>
Iabbr mtf meta.TextField()<CR><>
Iabbr m2m meta.ManyToManyField(<>, verbose_name='<>')<CR><>
Iabbr mfk meta.ForeignKey(<>, verbose_name='<>')<CR><>
Iabbr o2o meta.OneToOneField(<>, verbose_name='<>')<CR><>
endif
