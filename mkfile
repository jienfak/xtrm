<mkconfig

VERSION = 0.8.3
CPPFLAGS = $ADDCPPFLAGS \
	-DVERSION=\"$VERSION\"  \
	-D_XOPEN_SOURCE=600 \
	$INC
CFLAGS = $ADDCFLAGS
LDFLAGS = $LIB

SRC = `{ ls *.c }


OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT $TGT.1
	cp -f $TGT $ROOT/bin/
	sed s/VERSION/$VERSION/g <$TGT.1 > $ROOT/share/man/man1/$TGT.1
	chmod 0755 $ROOT/bin/$TGT
	chmod 0644 $ROOT/share/man/man1/$TGT.1
uninstall: 
	rm -f $ROOT/share/man/man1/$TGT.1 $ROOT/bin/$TGT
clean :
	rm -rf $TGT *.o 
