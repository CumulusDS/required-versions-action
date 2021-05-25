[![Create Release][release-badge]][release-url]
[![Import Labels][import-labels-badge]][import-labels-url]
[![Sync Labels][sync-labels-badge]][sync-labels-url]
[![PR AutoLabeler][autolabeler-badge]][autolabeler-url]
[![Assigner][assigner-badge]][assigner-url]

A simple action to give you the required versions of other microservices, as defined in a projects package.json.
Adds this information to the changelog file specified (default CHANGELOG.md)

Projects with required versions should be listed under `apiVersions` in package.json, with the key being identical
to the repository name

### Inputs
#### `version`
The current version that you want to list in the release notes under

#### `changelog`
The changelog to add the information to
Default: `CHANGELOG.md`

#### `githubUser`
The user that the repositories with required versions belong to.
Used for link generation for changelog additions.

### Outputs
#### `result`

### Example usage
```yaml
      - name: cfn_nag_scan packaged template
        id: scan-packaged
        uses: CumulusDS/required-versions-action@v0.0.1
        with:
          input: some-input
```

The results can be later referenced again for use in a separate step if desired using the `results` output from the step.
In order to reference the `result` output, you must assign and `id` to the step for future referencing.

```yaml
      - name: reprint results
        run: echo "${{ steps.action.outputs.result }}"
```


[release-badge]: https://github.com/CumulusDS/required-versions-action/actions/workflows/release.yml/badge.svg
[release-url]: https://github.com/CumulusDS/required-versions-action/actions/workflows/release.yml
[import-labels-badge]: https://github.com/CumulusDS/required-versions-action/actions/workflows/labels_import.yml/badge.svg
[import-labels-url]: https://github.com/CumulusDS/required-versions-action/actions/workflows/labels_import.yml
[sync-labels-badge]: https://github.com/CumulusDS/required-versions-action/actions/workflows/labels_sync.yml/badge.svg
[sync-labels-url]: https://github.com/CumulusDS/required-versions-action/actions/workflows/labels_sync.yml
[autolabeler-badge]: https://github.com/CumulusDS/required-versions-action/actions/workflows/autolabeler.yml/badge.svg
[autolabeler-url]: https://github.com/CumulusDS/required-versions-action/actions/workflows/autolabeler.yml
[assigner-badge]: https://github.com/CumulusDS/required-versions-action/actions/workflows/assign.yml/badge.svg
[assigner-url]: https://github.com/CumulusDS/required-versions-action/actions/workflows/assign.yml
