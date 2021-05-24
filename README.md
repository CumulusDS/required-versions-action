[![Create Release](https://github.com/CumulusDS/action-template/actions/workflows/release.yml/badge.svg)](https://github.com/CumulusDS/action-template/actions/workflows/release.yml)  

[![Import Labels](https://github.com/CumulusDS/action-template/actions/workflows/labels_import.yml/badge.svg)](https://github.com/CumulusDS/action-template/actions/workflows/labels_import.yml)  [![Sync Labels](https://github.com/CumulusDS/action-template/actions/workflows/labels_sync.yml/badge.svg)](https://github.com/CumulusDS/action-template/actions/workflows/labels_sync.yml)  

[![PR AutoLabeler](https://github.com/CumulusDS/action-template/actions/workflows/autolabeler.yml/badge.svg)](https://github.com/CumulusDS/action-template/actions/workflows/autolabeler.yml)  [![Assigner](https://github.com/CumulusDS/action-template/actions/workflows/assign.yml/badge.svg)](https://github.com/CumulusDS/action-template/actions/workflows/assign.yml)  

Description

### Inputs
#### `input`

### Outputs
#### `result`

### Example usage
```yaml
      - name: cfn_nag_scan packaged template
        id: scan-packaged
        uses: CumulusDS/action-template@v0.0.1
        with:
          input: some-input
```

The results can be later referenced again for use in a separate step if desired using the `results` output from the step.  
In order to reference the `result` output, you must assign and `id` to the step for future referencing.

```yaml
      - name: reprint results
        run: echo "${{ steps.action.outputs.result }}" 
```
