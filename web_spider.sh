#!/bin/bash

#autor xin


#History 
#     2014/07/07 xin version 1.0.0


script_name='Web Spider'
current_dir=$(pwd)

#mkdir work dir
work_dir=${current_dir}'/work_dir'
test -d $work_dir && rm -rf $work_dir
mkdir $work_dir
cd $work_dir

# install Dependence
sudo apt-get install zlib1g-dev lib32z1-dev  libxml2-dev libxslt1-dev \
    libxml2 python-dev python-pip git


#1 install lxml

pip install lxml

if [ $? != 0 ]; then 
    git clone git://github.com/lxml/lxml.git lxml 
    cd lxml
    python setup.py install 
    cd ..
fi

# install beaufitulsoup4
pip install beautifulsoup4

if [ $? != 0 ]; then 
    wget www.crummy.com/software/BeautifulSoup/bs4/download/4.3/beautifulsoup4-4.3.2.tar.gz
    tar -zxvf beautifulsoup4-4.3.2.tar.gz
    cd beautifulsoup4-4.3.2
    python setup.py install 
    cd ..
fi

#install requests
pip install requests

if [ $? != 0 ]; then
    git clone git://github.com/kennethreitz/requests.git request
    cd request
    python setup.py install
fi

#clean

rm -rf $work_dir

exit 0
