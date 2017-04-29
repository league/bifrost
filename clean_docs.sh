if [ -d "_static" ]; then
    mkdir -p static
    cp -rf _static/* static/*
fi
if [ -d "_modules" ]; then
    mkdir -p modules
    cp -rf _modules/* modules/*
fi
if [ -d "_sources" ]; then
    mkdir -p sources
    cp -rf _sources/* sources/*
fi

find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_static/ s/_static/static/' {} \;
find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_modules/ s/_modules/modules/' {} \;
find ./ -type f -exec sed -i -e '/\(href\|src\)=\"\(\.\.\/\)\?_sources/ s/_sources/sources/' {} \;
