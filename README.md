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
No outputs

### Example usage
Should follow after a changelog file is generated, or be referenced directly

```yaml
      - name: dependent versions
        uses: CumulusDS/required-versions-action@master
        with:
          githubUser: "CumulusDS"
          version: ${{ env.mostRecentTag }}
          changelog: "changelog/changelog.md"
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
