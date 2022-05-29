# docker-buildroot-action

This call a buildroot's make target using a docke with all dependencies installed.

## Inputs


## `make-target`

**Required** The target to call greet. Default `"help"`.

## `buildroot-path`

**Required** Path(relative to GITHUB_WORKSPACE) to the root of buildroot .

## `buildroot-external-path`

**Required** Path(relative to GITHUB_WORKSPACE) to the buildroot extrernal tree.


## Example usage

    uses: fmahiant/embedded-CI_docker-buildroot-action@v1
    with:
        make-target: 'all'
        buildroot-path: 'buildroot-2022.02'
        buildroot-external-path: 'my_br_externals'    