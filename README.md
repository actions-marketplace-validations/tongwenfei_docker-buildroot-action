# docker-buildroot-action

This call a buildroot's make target using a docker with all dependencies installed.

## Inputs


## `make_target`

**Required** The target to call greet. Default `"help"`.

## `buildroot_path`

**Required** Path(relative to GITHUB_WORKSPACE) to the root of buildroot .

## `buildroot_external_path`

**Required** Path(relative to GITHUB_WORKSPACE) to the buildroot extrernal tree.


## Example usage

    uses: fmahiant/embedded-CI_docker-buildroot-action@v1
    with:
        make_target: 'all'
        buildroot_path: 'buildroot-2022.02'
        buildroot_external-path: 'my_br_externals'    
