# flux-scheduled-release

## Purpose
For automated workloads, it may be desirable to only allow flux to update a managed workload at a specified time (e.g. Every day during off-hours)

As flux does not provide this capability natively, this is a workaround to enable this functionality.

## How it works

This resource defines a cronjob that will use `fluxctl` and the `flux` service account to force-update a workload on a specified schedule using cron syntax. 

Force updating allows a workload image to be modified without changing the lock policy.

https://docs.fluxcd.io/en/1.17.1/references/fluxctl.html#releasing-an-image-to-a-locked-workload

## Installation
1. Within `release-schedule.yaml`, replace instances of `<APP>` with a unique identifier for your deployment (e.g. `nks-notifier`)
2. Lock your workload to prevent automatic updates:
```
fluxctl lock --workload=deployment/nks-notifier -n nks-notifier
```
3. Deploy the `release-schedule.yaml` to the cluster via flux. 
* For consistency, it is recommended to keep this in the same directory as the workload it is associated with:
```
workloads/nks-notifier
├── nks-notifier.yaml
├── nks-token.yaml
├── registry-auth.yaml
└── release-schedule.yaml
```