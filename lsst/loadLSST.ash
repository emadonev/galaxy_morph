if [ -z "$SHELL" ]; then
    if [ -n "$BASH_VERSION" ]; then
        SHELL=bash
    elif [ -n "$ZSH_NAME" ]; then
        SHELL=zsh
    else
        # fall back to lowest common denominator shell
        SHELL=dash
    fi
fi
__conda_setup="$(/opt/anaconda3/bin/conda shell.$(basename "$SHELL") hook 2>/dev/null)" \
    || { echo "Unknown shell"; exit 1; }
eval "$__conda_setup" || { echo "Unable to start conda"; exit 1; }
[ -f "/opt/anaconda3/etc/profile.d/mamba.sh" ] && . "/opt/anaconda3/etc/profile.d/mamba.sh"
export LSST_CONDA_ENV_NAME=${LSST_CONDA_ENV_NAME:-lsst-scipipe-8.0.0}
conda activate "$LSST_CONDA_ENV_NAME" && export EUPS_PKGROOT=$(cat $EUPS_PATH/pkgroot)
