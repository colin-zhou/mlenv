if [ -f /bin/bash ]
then
	echo "file /bin/bash exists"
fi

if [ -d /bin/bash ]
then
	echo "/bin/bash is a directory"
else
	echo "/bin/bash is not a directory"
fi
