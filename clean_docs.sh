mkdir -p static
cp -rf _static/* static/
mkdir -p modules
cp -rf _modules/* modules/
mkdir -p sources
cp -rf _sources/* sources/

find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_static/ s/_static/static/' {} \;
find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_modules/ s/_modules/modules/' {} \;
find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_sources/ s/_sources/sources/' {} \;
find ./ -type f -exec sed -i -e '/\$\.ajax\(.*\)_sources/ s/_sources/sources/' {} \;
