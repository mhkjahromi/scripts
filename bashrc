#Android compile commends
export PATH=~/bin:$PATH
export USE_CCACHE=1
export USE_PREBUILT_CACHE=1
export PREBUILT_CACHE_DIR=~/.ccache
ccache -M 100G

#AEX build shorter commend
function aex
{
    mka aex -j$(nproc --all) | tee log.txt
}

#git conflicts list
function conlist
{
    git ls-files -u  | cut -f 2 | sort -u
}

# repo sync commend shortcut
function reposync
{
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
}

# cleaner shortcut
function clean
{
make -j12 clobber && make -j12 clean
}
