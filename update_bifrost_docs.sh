export CUR_DIR=$(pwd)
cd $HOME/Documents/bifrost7/docs
./generate_python_reference.sh
./generate_cpp_reference.sh
make html
command cp -rf $HOME/Documents/bifrost7/docs/build/html/* $HOME/Documents/bifrost-gh-pages/
cd $HOME/Documents/bifrost-gh-pages
./clean_docs.sh
cd $CUR_DIR
